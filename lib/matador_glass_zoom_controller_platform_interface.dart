import 'package:matador_glass_zoom_controller/classes/zoom_controller_response.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'matador_glass_zoom_controller_method_channel.dart';

abstract class MatadorGlassZoomControllerPlatform extends PlatformInterface {
  MatadorGlassZoomControllerPlatform() : super(token: _token);

  static final Object _token = Object();

  static MatadorGlassZoomControllerPlatform _instance = MethodChannelMatadorGlassZoomController();

  static MatadorGlassZoomControllerPlatform get instance => _instance;

  static set instance(MatadorGlassZoomControllerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<ZoomControllerResponse> launch(String displayName, String zoomUrl) {
    throw UnimplementedError('launch() has not been implemented');
  }
}
