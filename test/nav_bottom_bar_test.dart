import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nav_bottom_bar/nav_bottom_bar.dart';

void main() {
  const MethodChannel channel = MethodChannel('nav_bottom_bar');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
