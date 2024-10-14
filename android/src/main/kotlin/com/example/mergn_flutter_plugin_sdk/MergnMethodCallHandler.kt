package com.example.mergn_flutter_plugin_sdk

import android.app.AlertDialog
import android.app.Application
import android.content.Context
import android.util.Log
import com.mergn.insights.classes.AttributeManager
import com.mergn.insights.classes.EventManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MergnMethodCallHandler :
    FlutterPlugin, MethodChannel.MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private lateinit var applicationContext: Context
    private lateinit var context: Context
    private lateinit var application: Application
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "InitializeSdk" -> {
                com.mergn.insights.classes.MergnSDK.Companion.initialize(application)
                result.success("Successfully Initialized")
            }

            "registerAPI" -> {
                val apiKey = call.argument<String>("apiKey")
                val eventManager = EventManager()

                eventManager.registerApiKey(apiKey.toString(), applicationContext)
                result.success(apiKey)
            }

            "sendEvent" -> {
                val eventManager = EventManager()
                val eventName = call.argument<String>("eventName")!!
                val eventProperties = call.argument<Map<String, String>>("eventProperties")!!
                eventManager.sendEvent(eventName, eventProperties, context, applicationContext)
                //showDialog()

                result.success(null)
            }

            "sendAttribute" -> {
                val attributeManager = AttributeManager()
                val attributeName = call.argument<String>("attributeName")!!
                val attributeValue = call.argument<String>("attributeValue")!!
                // Call your EventManager's sendEvent method here with eventName and eventProperties
                attributeManager.sendAttribute(context, attributeName, attributeValue)
                result.success(null) // Send success result if needed
            }

            "login" -> {
                val eventManager = EventManager()
                val email = call.argument<String>("email")!!
                eventManager.login(email, context)
                result.success(null)
            }

            "fcm_token" -> {
                val eventManager = EventManager()
                val token = call.argument<String>("token")!!
                eventManager.firebaseToken(token, context)
                result.success(null)
            }


            else -> result.notImplemented()
        }
    }

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(binding.binaryMessenger, "mergnKotlinSDK")
        channel.setMethodCallHandler(this)
        application = binding.applicationContext as Application
        applicationContext= binding.applicationContext
        com.mergn.insights.classes.MergnSDK.Companion.initialize(application)
        Log.d("MergnMethodCallHandler", "onAttachedToEngine")
        print("onAttachedToEngine")

    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        Log.d("MergnMethodCallHandler", "onDetachedFromEngine")
        print("onDetachedFromEngine")

    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        context = binding.activity
        application = binding.activity.application
        Log.d("MergnMethodCallHandler", "onAttachedToActivity")
        print("onAttachedToActivity")
    }

    private fun showDialog() {
        AlertDialog.Builder(context)
            .setTitle("Native Dialog")
            .setMessage("This is a native Android dialog opened from Flutter.")
            .setPositiveButton("OK") { dialog, _ -> dialog.dismiss() }
            .setNegativeButton("Cancel") { dialog, _ -> dialog.dismiss() }
            .show()}

    override fun onDetachedFromActivityForConfigChanges() {
        context = applicationContext
        Log.d("MergnMethodCallHandler", "onDetachedFromActivityForConfigChanges")
        print("onDetachedFromActivityForConfigChanges")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        context = binding.activity
        application = binding.activity.application
        Log.d("MergnMethodCallHandler", "onReattachedToActivityForConfigChanges")
        print("onReattachedToActivityForConfigChanges")

    }

    override fun onDetachedFromActivity() {
        context= applicationContext
        Log.d("MergnMethodCallHandler", "onDetachedFromActivity")
        print("onDetachedFromActivity")

    }

}

/*
fun registerMergnMethodChannel(
    flutterEngine: FlutterEngine,
    mainActivity: MainActivity,
    application: Application,
    applicationContext : Context
) {
    val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "mergnKotlinSDK")
    channel.setMethodCallHandler(MergnMethodCallHandler(mainActivity,application,applicationContext))
}*/
