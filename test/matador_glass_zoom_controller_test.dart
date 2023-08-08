import 'package:flutter_test/flutter_test.dart';
import 'package:matador_glass_zoom_controller/classes/zoom_controller_response.dart';
import 'package:matador_glass_zoom_controller/matador_glass_zoom_controller.dart';
import 'package:matador_glass_zoom_controller/matador_glass_zoom_controller_platform_interface.dart';
import 'package:matador_glass_zoom_controller/matador_glass_zoom_controller_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMatadorGlassZoomControllerPlatform
    with MockPlatformInterfaceMixin
    implements MatadorGlassZoomControllerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<ZoomControllerResponse> launch(String displayName, String zoomUrl) {
    // TODO: implement launch
    throw UnimplementedError();
  }
}

void main() {
  final MatadorGlassZoomControllerPlatform initialPlatform = MatadorGlassZoomControllerPlatform.instance;

  test('$MethodChannelMatadorGlassZoomController is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMatadorGlassZoomController>());
  });

  test('getPlatformVersion', () async {
    MatadorGlassZoomController matadorGlassZoomControllerPlugin = MatadorGlassZoomController();
    MockMatadorGlassZoomControllerPlatform fakePlatform = MockMatadorGlassZoomControllerPlatform();
    MatadorGlassZoomControllerPlatform.instance = fakePlatform;

    expect(await matadorGlassZoomControllerPlugin.getPlatformVersion(), '42');
  });
}
