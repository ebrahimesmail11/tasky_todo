import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/features/home/ui/widgets/add_task_floating_action_button.dart';
import 'package:tasky_todo/features/home/ui/widgets/bar_code_floating_action_button.dart';
import 'package:tasky_todo/features/home/ui/widgets/home_app_bar_widget.dart';
import 'package:tasky_todo/features/home/ui/widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const HomeAppBarWidget(),
      body: const HomeBody(),
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