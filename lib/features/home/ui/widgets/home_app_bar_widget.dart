import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';
import 'package:tasky_todo/core/helpers/local_storage_helper.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class HomeAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Text(
            AppConstants.logo,
            style: TextStyles.font24BlackBold,
          ),
          const  Spacer(),
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.profileScreen);
            },
            child: SvgPicture.asset(
              IconsManager.profileIcon,
              height: 24.h,
              width: 24.w,
            ),
          ),
          horizontalSpace(20),
          GestureDetector(
            onTap: () async {
              await LocalStorageHelper.deleteAll();
              if (!context.mounted) return;
              context.pushNamedAndRemoveUntil(
                Routes.loginScreen,
                predicate: (Route<dynamic> route) {
                  return false;
                },
              );
            },
            child: SvgPicture.asset(
              IconsManager.exitIcon,
              height: 24.h,
              width: 24.w,
            ),
          ),
          horizontalSpace(8),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60.h);
}
