import 'package:flutter/material.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';
import 'package:tasky_todo/core/routing/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (!context.mounted) return;
      Navigator.pushNamedAndRemoveUntil(
        context,
        isloggedInUser ? Routes.homeScreen : Routes.onBoardingScreen,
        (route) => false,
      );
    });
    return Scaffold(
      backgroundColor: const Color(0xFF5F33E1),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              ImagesManager.splash,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
