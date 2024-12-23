import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
     text: TextSpan(
      children:[
        TextSpan( 
          text: 'Didn\'t have any account? ',
         style: TextStyles.font13DarkBlueRegular),
           TextSpan(
            text: 'Sign Up here',
            style: TextStyles.font13BlueSemiBold.copyWith(
                decoration: TextDecoration.underline, decorationThickness: 2),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushNamed(Routes.signUpScreen);
              },
          ),
      ],
     ),
    );
  }
}