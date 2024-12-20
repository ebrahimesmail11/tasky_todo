import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';

import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/features/detailstask/ui/widgets/option_drop_button.dart';

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailsAppBar({required this.title, super.key});
  final String title;
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
      actions:  const [
       OptionDropButton(),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 70.h);
}
