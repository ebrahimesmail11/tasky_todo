

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';


class DataPickerTextField extends StatelessWidget {
  const DataPickerTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: () async {
        await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(2080))
            .then((value) {
         // var formatedDate = convertTimestampToDate(value.toString());
        
        });
      },
      child: SvgPicture.asset(
        IconsManager.calendar,
        height: 30.h,
        width: 30.w,
      ),
    );
  }
}