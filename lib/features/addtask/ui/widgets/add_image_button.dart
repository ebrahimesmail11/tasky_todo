import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class AddImageButton extends StatelessWidget {
  const AddImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h, bottom: 15.h),
      child: GestureDetector(
        onTap: () {},
        child: DottedBorder(
          radius: const Radius.circular(10),
          color: ColorsManager.mainColor,
          borderType: BorderType.RRect,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 100.w, vertical: 12.h),
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                SvgPicture.asset(IconsManager.addPhoto),
                horizontalSpace(10),
                Text(
                  'Add Img',
                  style: TextStyles.font19purplemedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
