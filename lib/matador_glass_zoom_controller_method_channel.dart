import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:matador_glass_zoom_controller/classes/zoom_controller_response.dart';

import 'matador_glass_zoom_controller_platform_interface.dart';

/// An implementation of [MatadorGlassZoomControllerPlatform] that uses method channels.
class MethodChannelMatadorGlassZoomController
    extends MatadorGlassZoomControllerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('matador_glass_zoom_controller');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<ZoomControllerResponse> launch(
      String displayName, String zoomUrl) async {
    final result = await methodChannel.invokeMethod<Map<String, dynamic>>(
        'launch', {"displayName": displayName, "zoomUrl": zoomUrl});

    if (result == null) {
      return ZoomControllerResponse("500", "Unknown error occurred", null);
    }

    return ZoomControllerResponse.fromNative(result);
  }
}
