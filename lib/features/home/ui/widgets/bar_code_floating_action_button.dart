import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/theming/colors.dart';

import '../../../../core/helpers/images_manger.dart';

class BarCodeFloatingActionButton extends StatelessWidget {
  const BarCodeFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 50.w,
      child: FloatingActionButton(
        heroTag: 'tag_barcode',
        onPressed: () {
         
        },
        backgroundColor: ColorsManager.barcodeFABColor,
        shape: const CircleBorder(),
        child: SizedBox(
            height: 20.h,
            width: 20.w,
            child: SvgPicture.asset(IconsManager.barCodeIcon)),
      ),
    );
  }
}