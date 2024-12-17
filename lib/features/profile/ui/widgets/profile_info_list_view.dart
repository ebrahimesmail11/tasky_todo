import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';
import 'package:tasky_todo/features/profile/data/models/profile_response.dart';
import 'package:tasky_todo/features/profile/ui/widgets/profile_container.dart';

class ProfileInfoListView extends StatelessWidget {
  const ProfileInfoListView({required this.profile, super.key});
final  ProfileResponse profile;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsetsDirectional.only(
        start: 24.w,
        bottom: 15.h,
        end: 24.w,
      ),
      children: [
         ProfileContainer(
          title: 'Name',
          value: profile.displayName??'',
        ),
        Stack(
          children: [
             ProfileContainer(
              title: 'Phone',
              value: profile.phoneNumber??'',
            ),
            Positioned(
              right: 10,
              bottom: 0,
              top: 0,
              child: GestureDetector(
                onTap: () async {
                  await Clipboard.setData(
                    ClipboardData(text: profile.phoneNumber??''),
                  );
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Phone copy to clipboard"),
                  ));
                },
                child: SvgPicture.asset(IconsManager.copy),
              ),
            ),
          ],
        ),
         ProfileContainer(
          title: 'Level',
          value: profile.level??'',
        ),
         ProfileContainer(
          title: 'YEARS OF EXPERIENCE',
          value:profile.experienceYears.toString() ,
        ),
         ProfileContainer(
          title: 'Location',
          value: profile.address??'',
        ),
      ],
    );
  }
}
