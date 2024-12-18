import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';

void setupErrorState(BuildContext context, String error) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font15DarkBlueMedium,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font14BlueSemiBold,
          ),
        ),
      ],
    ),
  );
}

String getFlagImage(String priority) {
  switch (priority) {
    case 'low':
      return IconsManager.blueFlagIcon;
    case 'medium':
      return IconsManager.purpleFlagIcon;
    case 'high':
      return IconsManager.redFlagIcon;
    default:
      return '';
  }
}

Color getFlagTextColor(String priority) {
  switch (priority) {
    case 'low':
      return ColorsManager.textBlue;
    case 'medium':
      return ColorsManager.mainColor;
    case 'high':
      return ColorsManager.textRed;
    default:
      return Colors.white;
  }
}

// Color getFlagContainerColor(String priority) {
//   switch (priority) {
//     case 'low':
//       return ColorsManager.containerBlue;
//     case 'medium':
//       return ColorsManager.containerMain;
//     case 'high':
//       return ColorsManager.containerRed;
//     default:
//       return Colors.white;
//   }
// }

Color getRightStatusContainerColor(String status) {
  switch (status) {
    case 'waiting':
      return ColorsManager.containerRed;
    case 'inProgress':
      return ColorsManager.containerMain;
    case 'finished':
      return ColorsManager.containerBlue;
    default:
      return Colors.white;
  }
}

Color getRightStatusTextColor(String status) {
  switch (status) {
    case 'waiting':
      return ColorsManager.textRed;
    case 'inProgress':
      return ColorsManager.mainColor;
    case 'finished':
      return ColorsManager.textBlue;
    default:
      return Colors.white;
  }
}

String convertTimestampToDate(String time) {
  // تحويل النص إلى كائن DateTime
  DateTime dateTime = DateTime.parse(time);

  // استخدام DateFormat لتنسيق التاريخ
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);

  return formattedDate;
}
ScrollBehavior buildScrollBehavior(BuildContext context) {
  return ScrollConfiguration.of(context).copyWith(
    dragDevices: {
      PointerDeviceKind.touch,
      PointerDeviceKind.mouse,
    }
  );
}
 String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}