import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/di/dependency_injection.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/widgets/custom_app_bar.dart';
import 'package:tasky_todo/features/addtask/logic/upload/upload_image_cubit.dart';
import 'package:tasky_todo/features/edit_task/cubit/edit_task_cubit.dart';
import 'package:tasky_todo/features/edit_task/data/models/edit_task_response.dart';
import 'package:tasky_todo/features/edit_task/ui/widgets/edit_task_form.dart';
import 'package:tasky_todo/features/edit_task/ui/widgets/edit_task_image_button.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({required this.editTaskResponse , super.key});
  final EditTaskResponse editTaskResponse;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UploadImageCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EditTaskCubit>(),
        ),
      ],
      child:  Scaffold(
        appBar: const CustomAppBar(
          title: AppConstants.editTask,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: Column(
              children: [
                 EditTaskImageButton(
                  imageUrl: editTaskResponse.image??'',
                ),
                verticalSpace(16),
                EditTaskForm(editaskResponse: editTaskResponse,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
