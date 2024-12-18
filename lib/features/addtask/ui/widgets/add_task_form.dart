import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/app_text_button.dart';
import 'package:tasky_todo/core/widgets/app_text_from_field.dart';
import 'package:tasky_todo/features/addtask/ui/widgets/data_picker_text_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController dueDateController = TextEditingController();
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
          // CustomRowDropButton(
          //     containerColor: 'containerColor',
          //     displayName: 'displayName',
          //     apiValue: 'apiValue',
          //     values: values,
          //     onValueSelected: onValueSelected,
          //     flagImage: flagImage,
          //     initialValue: initialValue,
          //     textColor: textColor),
          verticalSpace(16),
          Text(
            'Due date',
            style: TextStyles.font12GrayRegular,
          ),
          verticalSpace(8),
          Stack(
            children: [
              AppTextFormField(
                  enabled: false,
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
          AppTextButton(
            buttonText: 'Add Task',
            textStyle: TextStyles.font19WhiteBold.copyWith(
              fontSize: 18.sp,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
