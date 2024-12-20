import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/utils.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class ColorChanagingStatusContainer extends StatelessWidget {
  const ColorChanagingStatusContainer({required this.status, super.key});
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.r),
        color: getRightStatusContainerColor(status),
      ),
      child: Row(
        children: [
          Text(status,
              style: TextStyles.font16GreyBold
                  .copyWith(color: getRightStatusTextColor(status))),
        ],
      ),
    );
  }
}
