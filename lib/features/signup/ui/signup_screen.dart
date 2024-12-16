import 'package:flutter/material.dart';
import 'package:tasky_todo/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:tasky_todo/features/signup/ui/widgets/section_signup_form.dart';
import 'package:tasky_todo/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:tasky_todo/features/signup/ui/widgets/signup_image.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingupImage(),
              SectionSignupForm(),
              AlreadyHaveAccountText(),
              SignupBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
