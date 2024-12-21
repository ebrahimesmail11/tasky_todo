import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/enums.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/helpers/utils.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/app_text_button.dart';
import 'package:tasky_todo/core/widgets/app_text_from_field.dart';
import 'package:tasky_todo/features/addtask/logic/upload/upload_image_cubit.dart';
import 'package:tasky_todo/features/addtask/ui/widgets/custom_row_drop_button.dart';
import 'package:tasky_todo/features/addtask/ui/widgets/data_picker_text_field.dart';
import 'package:tasky_todo/features/edit_task/cubit/edit_task_cubit.dart';
import 'package:tasky_todo/features/edit_task/data/models/edit_task_request.dart';
import 'package:tasky_todo/features/edit_task/data/models/edit_task_response.dart';

class EditTaskForm extends StatefulWidget {
  const EditTaskForm({required this.editaskResponse, super.key});
  final EditTaskResponse editaskResponse;
  @override
  State<EditTaskForm> createState() => _EditTaskFormState();
}

class _EditTaskFormState extends State<EditTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
  String taskPririty = Priority.low.name;
  String taskStatus = Status.waiting.name;
  @override
  void initState() {
    super.initState();
    titleController.text = widget.editaskResponse.title ?? '';
    descController.text = widget.editaskResponse.desc ?? '';
    taskPririty = widget.editaskResponse.priority ?? Priority.low.name;
    taskStatus = widget.editaskResponse.status ?? Status.waiting.name;
    dueDateController.text = widget.editaskResponse.createdAt ?? '';
  }

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Task title',
            style: TextStyles.font12GrayRegular,
          ),
          verticalSpace(8),
          AppTextFormField(
              controller: titleController,
              hintText: 'Enter Title Here...',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter title';
                }
              }),
          verticalSpace(16),
          Text(
            'Task description',
            style: TextStyles.font12GrayRegular,
          ),
          verticalSpace(8),
          AppTextFormField(
              maxLines: 5,
              minLines: 5,
              controller: descController,
              hintText: 'Add description Here...',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'please enter description';
                }
              }),
          verticalSpace(16),
          Text(
            'Priority',
            style: TextStyles.font12GrayRegular,
          ),
          verticalSpace(8),
          CustomRowDropButton<Priority>(
            initialValue: PriorityExtension.fromApiValue(taskPririty),
            values: Priority.values,
            displayName: (priority) => priority.displayName,
            apiValue: (priority) => priority.apiValue,
            containerColor: (priority) =>
                getFlagContainerColor(priority.apiValue),
            flagImage: (priority) => getFlagImage(priority.apiValue),
            textColor: (priority) => getFlagTextColor(priority.apiValue),
            onValueSelected: (priority) {
              setState(() {
                taskPririty = priority.apiValue; // تحديث الأولوية
              });
            },
          ),
          verticalSpace(16),
          Text(
            'Status',
            style: TextStyles.font12GrayRegular,
          ),
          verticalSpace(8),
          CustomRowDropButton<Status>(
            initialValue: StatusExtension.fromApiValue(taskStatus),
            values: Status.values,
            displayName: (status) => status.displayName,
            apiValue: (status) => status.apiValue,
            containerColor: (status) =>
                getRightStatusContainerColor(status.apiValue),
            textColor: (status) => getRightStatusTextColor(status.apiValue),
            onValueSelected: (status) {
              setState(() {
                taskStatus = status.apiValue;
              });
            },
          ),
          verticalSpace(16),
          Text(
            'Due date',
            style: TextStyles.font12GrayRegular,
          ),
          verticalSpace(8),
          Stack(
            children: [
              AppTextFormField(
                  //enabled: false,
                  keyboardType: TextInputType.datetime,
                  controller: dueDateController,
                  hintText: 'Choose due date',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please enter dueDate';
                    }
                  }),
              const Positioned(
                right: 10,
                top: 10,
                child: DataPickerTextField(),
              ),
            ],
          ),
          verticalSpace(16),
          BlocConsumer<EditTaskCubit, EditTaskState>(
            listener: (context, state) {
              state.whenOrNull(success: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Task added successfully!')),
                );
                context.pop();
              }, failure: (error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error)),
                );
              });
            },
            builder: (context, state) {
              return state.maybeWhen(loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }, orElse: () {
                return AppTextButton(
                  buttonText: 'update Task',
                  textStyle: TextStyles.font19WhiteBold.copyWith(
                    fontSize: 18.sp,
                  ),
                  onPressed: () {
                    validateThenDoAddTask();
                  },
                );
              });
            },
          ),
          verticalSpace(16),
        ],
      ),
    );
  }

  void validateThenDoAddTask() {
    if (_formKey.currentState!.validate()) {
      context.read<EditTaskCubit>().editTask(
          id: widget.editaskResponse.id!,
          body: EditTaskRequest(
            image: context.read<UploadImageCubit>().getimageUrl,
            title: titleController.text,
            desc: descController.text,
            priority: taskPririty,
            status: taskStatus,
            dueDate: descController.text,
          ));
    }
  }
}
