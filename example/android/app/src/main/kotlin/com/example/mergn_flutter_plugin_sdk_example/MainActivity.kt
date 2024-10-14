package com.example.mergn_flutter_plugin_sdk_example

import android.os.Bundle
import android.os.PersistableBundle
import com.mergn.insights.classes.MergnSDK
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity(){
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        MergnSDK.initialize(this.application)
    }
}
