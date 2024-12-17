import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){},
            child: Container(
             margin: EdgeInsets.only(left: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: ColorsManager.containerGrey,
                 borderRadius: BorderRadius.circular(50.r),
              ),
              child: Center(
                child: Text(
                  'category item1',
                  style:  TextStyles.font16GreyRegular,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
