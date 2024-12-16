import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/features/login/ui/widgets/dont_have_account_text.dart';
import 'package:tasky_todo/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:tasky_todo/features/login/ui/widgets/phone_and_password.dart';
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
                    const LoginBlocListener(),
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
