import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/di/dependency_injection.dart';
import 'package:tasky_todo/core/helpers/bloc_observer.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/local_storage_helper.dart';
import 'package:tasky_todo/core/networking/services/api_constants.dart';
import 'package:tasky_todo/core/routing/route_manger.dart';
import 'package:tasky_todo/tasky_todo_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpGetIt();
  await checkIfLoggedInUser();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = AppBlocObserver();
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return MyApp(
          routeManger: RouteManger(),
        );
      }));
}

checkIfLoggedInUser() async {
  final accessToken = await LocalStorageHelper.read(ApiConstants.accessToken);
  if (accessToken == null || accessToken.toString().isEmpty) {
    isloggedInUser = false;
  } else {
    isloggedInUser = true;
  }
}
