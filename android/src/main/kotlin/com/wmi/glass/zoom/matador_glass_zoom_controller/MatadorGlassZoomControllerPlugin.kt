package com.wmi.glass.zoom.matador_glass_zoom_controller

import android.content.ActivityNotFoundException
import android.content.Context
import android.content.Intent
import android.net.Uri
import androidx.annotation.NonNull
import androidx.core.content.ContextCompat.startActivity

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** MatadorGlassZoomControllerPlugin */
class MatadorGlassZoomControllerPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel =
            MethodChannel(flutterPluginBinding.binaryMessenger, "matador_glass_zoom_controller")
        context = flutterPluginBinding.applicationContext
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
            "launch" -> run {
                var intent = Intent(Intent.ACTION_VIEW)

                intent.data = Uri.parse("glass://launcher.zoom")
                intent.putExtra("zoomUrl", call.argument<String>("zoomUrl"))
                intent.putExtra("displayName", call.argument<String>("displayName"))
                intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK

                try {
                    context.startActivity(intent)

                    result.success(
                        mapOf(
                            "code" to 200,
                            "message" to "Success",
                            "additional_data" to null
                        )
                    )
                } catch (e: ActivityNotFoundException) {
                    result.success(
                        mapOf(
                            "code" to 404,
                            "message" to "Please install ZOOM included in this app",
                            "additional_data" to e.message
                        )
                    )
                }
            }

            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
