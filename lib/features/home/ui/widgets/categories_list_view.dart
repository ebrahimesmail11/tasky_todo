import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/features/home/cubit/home_cubit.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final homeCubit = context.read<HomeCubit>();
        return SizedBox(
          height: 40.h,
          child: ListView.builder(
            itemCount: homeCubit.categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  homeCubit.changeTaskStatusCategory(homeCubit.categoriesList[index]);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: homeCubit.selectIndex == index
                        ? ColorsManager.mainColor
                        : ColorsManager.containerGrey,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: Text(
                      homeCubit.categoriesList[index],
                      style: TextStyles.font16GreyRegular.copyWith(
                        color: homeCubit.selectIndex == index
                            ? Colors.white
                            : ColorsManager.textgrey,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
