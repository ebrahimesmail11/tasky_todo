import 'package:flutter/material.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/widgets/app_text_from_field.dart';
import 'package:tasky_todo/core/widgets/phone_text_field.dart';

class PhoneAndPassword extends StatefulWidget {
  const PhoneAndPassword({super.key});

  @override
  State<PhoneAndPassword> createState() => _PhoneAndPasswordState();
}

class _PhoneAndPasswordState extends State<PhoneAndPassword> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: UniqueKey(),
      child: Column(
        children: [
          PhoneTextField(
            phoneController: TextEditingController(),
            onChanged: (p0) {},
          ),
          verticalSpace(20),
          AppTextFormField(
            controller: TextEditingController(),
            hintText: 'Password',
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),

        ],
      ),
    );
  }
}
