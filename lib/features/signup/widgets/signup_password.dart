import 'package:flutter/material.dart';
import 'package:tasky_todo/core/widgets/app_text_from_field.dart';

class SignupPassword extends StatefulWidget {
  const SignupPassword({required this.controller, super.key});
  final TextEditingController controller;
  @override
  State<SignupPassword> createState() => _SignupPasswordState();
}

class _SignupPasswordState extends State<SignupPassword> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: widget.controller,
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
        if (value.length < 8) {
          return 'Passowrd length must be more than 8 characters';
        }
      },
    );
  }
}
