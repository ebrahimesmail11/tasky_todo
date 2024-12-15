import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/app_text_button.dart';
import 'package:tasky_todo/features/login/widgets/dont_have_account_text.dart';
import 'package:tasky_todo/features/login/widgets/phone_and_password.dart';
import 'package:tasky_todo/features/onboarding/widgets/landing_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 1000;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LandingImage(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLargeScreen ? 300.w : 30.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppConstants.login,
                      style: TextStyles.font24BlackBold,
                    ),
                    verticalSpace(24),
                    const PhoneAndPassword(),
                    verticalSpace(24),
                    AppTextButton(
                      buttonText: "Sign In",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              verticalSpace(24),
              const DontHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
