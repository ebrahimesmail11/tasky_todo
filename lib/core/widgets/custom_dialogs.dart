import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/widgets/custom_button.dart';


class CustomDialogs {
  const CustomDialogs._();

  static void twoButtonDialog({
    required BuildContext context,
    required String textBody,
    required String textButton1,
    required String textButton2,
    required void Function() onPressed,
    required bool isLoading,
  }) {
    showDialog<dynamic>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey,
          title: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
            child: Center(
              child: Text(
                 textBody,
                style: context.displaySmall!.copyWith(
                  fontSize: 18.sp,
                  color: ColorsManager.textBlack,
                  fontWeight: FontWeight.w500,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          actions: [
            CustomButton(
              backgroundColor: Colors.red,
                onPressed: onPressed,
                text: textButton1,
                width: 320.w,
                height: 45.h,
                isLoading: isLoading,
                lastRadius: 10,
                threeRadius: 10,
                ),
                SizedBox(height: 10.h, width: 1.w,),
                CustomButton(
                onPressed: (){
                  context.pop();
                },
                text: textButton2,
                width: 320.w,
                height: 45.h,
                isLoading: isLoading,
                lastRadius: 10,
                threeRadius: 10,
                ),
          ],
        );
      },
    );
  }
}