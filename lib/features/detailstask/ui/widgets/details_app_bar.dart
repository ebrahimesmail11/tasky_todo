import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';

import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/features/detailstask/ui/widgets/option_drop_button.dart';
import 'package:tasky_todo/features/edit_task/data/models/edit_task_response.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({required this.editTaskResponse, required this.title,required this.id, super.key});
  final String title;
  final String id;
  final  EditTaskResponse editTaskResponse;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w),
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Image.asset(
                IconsManager.arrowLeftDark,
                height: 20.h,
                width: 20.w,
              ),
            ),
          ),
          Flexible(
            child: Text(
              title,
              style: TextStyles.font16BlackBold,
            ),
          ),
        ],
      ),
      actions:   [
       OptionDropButton(editTaskResponse: editTaskResponse,id: id,),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
