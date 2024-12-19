import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/helpers/utils.dart';
import 'package:tasky_todo/core/theming/styles.dart';

import 'package:tasky_todo/features/home/ui/widgets/categories_list_view.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: buildScrollBehavior(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Text(
              AppConstants.myTasks,
              style: TextStyles.font16GreyBold,
            ),
          ),
          verticalSpace(16),
          const CategoriesListView(),
          verticalSpace(20),
        ],
      ),
    );
  }
}
