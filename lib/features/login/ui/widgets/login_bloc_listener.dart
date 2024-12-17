import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/features/login/logic/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
     listenWhen: (previous, current) =>
         current is Failure || current is Success || current is Loading,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainColor,
              ),
            ),
          );
        }, success: (data) {
          context.pushNamedAndRemoveUntil(Routes.homeScreen,
              predicate: (route) => false);
        }, failure: (error) {
          return setupErrorState(context, error);
        });
      },
      child: const SizedBox.shrink(),
    );
  }
  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
