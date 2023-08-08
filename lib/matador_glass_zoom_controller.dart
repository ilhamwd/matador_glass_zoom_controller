import 'package:matador_glass_zoom_controller/classes/zoom_controller_response.dart';

import 'matador_glass_zoom_controller_platform_interface.dart';

class MatadorGlassZoomController {
  static Future<String?> getPlatformVersion() {
    return MatadorGlassZoomControllerPlatform.instance.getPlatformVersion();
  }

  static Future<ZoomControllerResponse> launchZoom(
      String displayName, String zoomUrl) {
    return MatadorGlassZoomControllerPlatform.instance
        .launch(displayName, zoomUrl);
  }
}
