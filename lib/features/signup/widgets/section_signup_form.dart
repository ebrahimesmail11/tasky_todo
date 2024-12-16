import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/app_regex.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/app_text_from_field.dart';
import 'package:tasky_todo/core/widgets/phone_text_field.dart';
import 'package:tasky_todo/features/signup/widgets/experience_level_drop_down.dart';
import 'package:tasky_todo/features/signup/widgets/signup_password.dart';

class SectionSignupForm extends StatelessWidget {
  const SectionSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: UniqueKey(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.login,
              style: TextStyles.font24BlackBold,
            ),
            verticalSpace(24),
            AppTextFormField(
              hintText: AppConstants.name,
              validator: (p0) {
                if (p0.isNullOrEmpty()) {
                  return 'Please enter a valid name';
                }
              },
            ),
            verticalSpace(15),
            PhoneTextField(
              phoneController: TextEditingController(),
              onChanged: (p0) {},
            ),
            verticalSpace(15),
            AppTextFormField(
              keyboardType: TextInputType.number,
              hintText: AppConstants.yearsOfExperience,
              validator: (p0) {
                if (p0 == null ||
                    p0.isEmpty ||
                    !AppRegex.isValidYearsOfExperience(p0)) {
                  return 'Enter Valid Number';
                }
              },
            ),
            verticalSpace(24),
             ExperienceLevelDropDown(
              textEditingController: TextEditingController(),
             ),
            verticalSpace(24),
            AppTextFormField(
              hintText: AppConstants.address,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter address';
                }
              },
            ),
            verticalSpace(24),
            SignupPassword(
              controller: TextEditingController(),
            ),
            verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
