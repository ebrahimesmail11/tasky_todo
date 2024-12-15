import 'package:flutter/material.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class OnBoardingText extends StatelessWidget {
  const OnBoardingText({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
       final double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * .10,
          child: Center(
            child: Text(
              AppConstants.taskManagementTitle,
              style: TextStyles.font24BlackBold,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        verticalSpace(16),
        Text(
          AppConstants.taskManagementDescription,
          style: TextStyles.font14GreyRegular
              .copyWith(height: 1.5, fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
          textHeightBehavior:
              const TextHeightBehavior(applyHeightToLastDescent: true),
        ),
      ],
    );
  }
}
