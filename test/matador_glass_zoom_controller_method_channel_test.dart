import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matador_glass_zoom_controller/matador_glass_zoom_controller_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelMatadorGlassZoomController platform = MethodChannelMatadorGlassZoomController();
  const MethodChannel channel = MethodChannel('matador_glass_zoom_controller');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
