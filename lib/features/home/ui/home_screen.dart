import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/di/dependency_injection.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/features/detailstask/logic/cubit/delete_task_cubit.dart';
import 'package:tasky_todo/features/home/cubit/home_cubit.dart';
import 'package:tasky_todo/features/home/ui/widgets/add_task_floating_action_button.dart';
import 'package:tasky_todo/features/home/ui/widgets/bar_code_floating_action_button.dart';
import 'package:tasky_todo/features/home/ui/widgets/home_app_bar_widget.dart';
import 'package:tasky_todo/features/home/ui/widgets/home_body.dart';
import 'package:tasky_todo/features/home/ui/widgets/home_list_view_bloc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  late final DeleteTaskCubit deleteTaskCubit;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    deleteTaskCubit = getIt<DeleteTaskCubit>();
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    deleteTaskCubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<HomeCubit>().loadedMoreGetTodoList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBarWidget(),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<HomeCubit>().getTodos();

          return;
        },
        child: Column(
          children: [
            const HomeBody(),
            Expanded(
              child: HomeListViewBlocBuilder(
                scrollController: _scrollController,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Column _buildFloatingActionButton() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Platform.isWindows
            ? const SizedBox()
            : const BarCodeFloatingActionButton(),
        verticalSpace(14.h),
        const AddTaskFloatingActionButton(),
      ],
    );
  }
}
