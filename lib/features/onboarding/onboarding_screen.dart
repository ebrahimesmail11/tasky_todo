import 'package:flutter/material.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/features/onboarding/widgets/landing_image.dart';
import 'package:tasky_todo/features/onboarding/widgets/onboarding_text.dart';
import 'package:tasky_todo/features/onboarding/widgets/onboarding_text_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LandingImage(),
              const OnBoardingText(),
              verticalSpace(24),
              const  OnboardingTextButton(),
            ],
          ),
        ),
      ),
    );
  }
}


