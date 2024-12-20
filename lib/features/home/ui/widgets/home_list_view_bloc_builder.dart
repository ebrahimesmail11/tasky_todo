import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/features/home/cubit/home_cubit.dart';
import 'package:tasky_todo/features/home/ui/widgets/task_list_tile.dart';

import '../../../../core/theming/colors.dart';

class HomeListViewBlocBuilder extends StatelessWidget {
  const HomeListViewBlocBuilder({required this.scrollController, super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = context.read<HomeCubit>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is Loading && !homeCubit.isHasMoreTodoLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (homeCubit.filteredList != null) {
          return homeCubit.filteredList!.isNotEmpty
              ? ListView.separated(
                  separatorBuilder: (context, index) => verticalSpace(20),
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 22.w),
                  itemCount: homeCubit.filteredList!.length +
                      (homeCubit.isHasMoreTodoLoading ? 1 : 0),
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    if (index >= homeCubit.filteredList!.length) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: ColorsManager.mainColor,
                        ),
                      );
                    } else {
                      final task = homeCubit.filteredList![index];
                      return TaskListTile(todo: task);
                    }
                  },
                )
              : SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height - 250.h,
                          child: Text(
                            'No Tasks',
                            style: TextStyles.font18DarkGreyBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
