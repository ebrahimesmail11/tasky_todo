import 'package:flutter/material.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/app_text_button.dart';

class SectionSignupButton extends StatelessWidget {
  const SectionSignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppTextButton(
            buttonText: AppConstants.signUp,
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {},
          );
  }
}