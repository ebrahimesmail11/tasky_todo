import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/routing/route_manger.dart';
import 'package:tasky_todo/tasky_todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return MyApp(
          routeManger: RouteManger(),
        );
      }));
}
