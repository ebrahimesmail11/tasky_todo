import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/routing/route_manger.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.routeManger, super.key});
  final RouteManger routeManger;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Tasky',
        theme: ThemeData(
          fontFamily: TextStyles.dmSan,
          primaryColor: ColorsManager.mainColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashScreen,
        onGenerateRoute: routeManger.generateRoute,
      ),
    );
  }
}
