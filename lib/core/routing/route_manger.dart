import 'package:flutter/material.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/features/home/ui/home_screen.dart';
import 'package:tasky_todo/features/login/ui/login_screen.dart';

import 'package:tasky_todo/features/onboarding/onboarding_screen.dart';
import 'package:tasky_todo/features/signup/ui/signup_screen.dart';
import 'package:tasky_todo/features/splash/splash_screen.dart';

class RouteManger {
  Route? generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
