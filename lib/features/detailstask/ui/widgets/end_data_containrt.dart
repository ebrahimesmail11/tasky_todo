import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/font_weight_helper.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class EndDataContainer extends StatelessWidget {
  const EndDataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.r),
          color: ColorsManager.containerMain),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'End Date',
                style: TextStyles.font12GrayRegular.copyWith(fontSize: 11),
              ),
              Text(
                '30 June, 2022',
                style: TextStyles.font16BlackBold
                    .copyWith(fontWeight: FontWeightHelper.regular),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            IconsManager.calendar,
            height: 30,
            width: 30,
          )
        ],
      ),
    );
  }
}
