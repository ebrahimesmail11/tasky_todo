import 'package:flutter/material.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/features/login/login_screen.dart';
import 'package:tasky_todo/features/onboarding/onboarding_screen.dart';
import 'package:tasky_todo/features/signup/signup_screen.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
