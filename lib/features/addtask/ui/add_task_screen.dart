
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/widgets/custom_app_bar.dart';
import 'package:tasky_todo/features/addtask/ui/widgets/add_image_button.dart';
import 'package:tasky_todo/features/addtask/ui/widgets/add_task_form.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: const CustomAppBar(title: AppConstants.addNewTask,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child:  Column(
            children: [
            const  AddImageButton(),
             verticalSpace(16),
             const AddTaskForm(),
            ],
          ),
        ),
      ),
    );
  }
}