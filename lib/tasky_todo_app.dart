import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/di/dependency_injection.dart';
import 'package:tasky_todo/core/routing/route_manger.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/features/login/logic/login_cubit.dart';
import 'package:tasky_todo/features/signup/logic/sign_up_cubit.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.routeManger, super.key});
  final RouteManger routeManger;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<LoginCubit>(),
          ),
        ],
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
      ),
    );
  }
}
