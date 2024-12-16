import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/app_regex.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/app_text_button.dart';
import 'package:tasky_todo/core/widgets/app_text_from_field.dart';
import 'package:tasky_todo/core/widgets/phone_text_field.dart';
import 'package:tasky_todo/features/signup/data/models/signup_request_body.dart';
import 'package:tasky_todo/features/signup/logic/sign_up_cubit.dart';
import 'package:tasky_todo/features/signup/ui/widgets/experience_level_drop_down.dart';
import 'package:tasky_todo/features/signup/ui/widgets/signup_password.dart';

class SectionSignupForm extends StatefulWidget {
  const SectionSignupForm({
    super.key,
  });

  @override
  State<SectionSignupForm> createState() => _SectionSignupFormState();
}

class _SectionSignupFormState extends State<SectionSignupForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController yearsOfExperinceController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController experienceLevelController =
      TextEditingController();
  String? fullPhoneNumberValue;
  final TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    yearsOfExperinceController.dispose();
    addressController.dispose();
    experienceLevelController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
              controller: nameController,
              validator: (p0) {
                if (p0.isNullOrEmpty()) {
                  return 'Please enter a valid name';
                }
              },
            ),
            verticalSpace(15),
            PhoneTextField(
              phoneController: phoneController,
              onChanged: (p0) {
                fullPhoneNumberValue = p0;
              },
            ),
            verticalSpace(15),
            AppTextFormField(
              keyboardType: TextInputType.number,
              hintText: AppConstants.yearsOfExperience,
              controller: yearsOfExperinceController,
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
              textEditingController: experienceLevelController,
            ),
            verticalSpace(24),
            AppTextFormField(
              controller: addressController,
              hintText: AppConstants.address,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter address';
                }
              },
            ),
            verticalSpace(24),
            SignupPassword(
              controller: passwordController,
            ),
            verticalSpace(24),
            AppTextButton(
              buttonText: AppConstants.signUp,
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                _validateFormSignUp();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _validateFormSignUp() {
    if (formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp(
            SignupRequestBody(
                displayName: nameController.text,
                phone: fullPhoneNumberValue!,
                password: passwordController.text.trim(),
                address: addressController.text,
                experienceYears: int.parse(yearsOfExperinceController.text),
                level: experienceLevelController.text),
          );
    }
  }
}
