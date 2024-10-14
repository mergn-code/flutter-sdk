package com.mergn.mergn_flutter_plugin

import com.example.mergn_flutter_plugin_sdk.MergnMethodCallHandler
import com.mergn.insights.classes.MergnSDK
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity(){
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        //Initialize Mergn SDK
        MergnSDK.initialize(application)
       // MergnMethodCallHandler(this,application,applicationContext)

    }

}
