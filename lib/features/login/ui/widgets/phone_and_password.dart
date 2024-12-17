import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/app_text_button.dart';
import 'package:tasky_todo/core/widgets/app_text_from_field.dart';
import 'package:tasky_todo/core/widgets/phone_text_field.dart';
import 'package:tasky_todo/features/login/logic/login_cubit.dart';
import 'package:tasky_todo/features/login/data/models/login_request_body.dart';

class PhoneAndPassword extends StatefulWidget {
  const PhoneAndPassword({super.key});

  @override
  State<PhoneAndPassword> createState() => _PhoneAndPasswordState();
}

class _PhoneAndPasswordState extends State<PhoneAndPassword> {
  bool isObscureText = true;
  final  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final  TextEditingController phoneController = TextEditingController();
  String? phoneNumber;
  final  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
     super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          PhoneTextField(
            phoneController: phoneController,
            onChanged: (p0) {
              phoneNumber = p0;
            },
          ),
          verticalSpace(20),
          AppTextFormField(
            controller: passwordController,
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
          verticalSpace(24),
          AppTextButton(
            buttonText: "Sign In",
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {
              _validateThenDoLogin();
            },
          ),
        ],
      ),
    );
  }
  void _validateThenDoLogin(){
    if(formKey.currentState!.validate()){
      context.read<LoginCubit>().login(body: LoginRequestBody(
        phone: phoneNumber!,
        password: passwordController.text,
      ),);
    }
  }
}
