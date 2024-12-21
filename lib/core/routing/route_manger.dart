import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_todo/core/di/dependency_injection.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/features/addtask/logic/cubit/add_task_cubit.dart';
import 'package:tasky_todo/features/addtask/logic/upload/upload_image_cubit.dart';
import 'package:tasky_todo/features/addtask/ui/add_task_screen.dart';
import 'package:tasky_todo/features/detailstask/logic/cubit/delete_task_cubit.dart';

import 'package:tasky_todo/features/detailstask/ui/details_task.dart';
import 'package:tasky_todo/features/edit_task/data/models/edit_task_response.dart';
import 'package:tasky_todo/features/edit_task/ui/edit_task_screen.dart';
import 'package:tasky_todo/features/home/cubit/home_cubit.dart';
import 'package:tasky_todo/features/home/ui/home_screen.dart';
import 'package:tasky_todo/features/login/ui/login_screen.dart';

import 'package:tasky_todo/features/onboarding/onboarding_screen.dart';
import 'package:tasky_todo/features/profile/ui/profile_screen.dart';
import 'package:tasky_todo/features/signup/ui/signup_screen.dart';
import 'package:tasky_todo/features/splash/splash_screen.dart';

class RouteManger {
  Route? generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..getTodos(),
            child: const HomeScreen(),
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case Routes.addTaskScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<UploadImageCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<AddTaskCubit>(),
              ),
              BlocProvider.value(value: getIt<DeleteTaskCubit>()),
            ],
            child: const AddTaskScreen(),
          ),
        );
      case Routes.detailsTaskScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DeleteTaskCubit>(),
            child: DetailsTaskScreen(
              id: arg! as String,
            ),
          ),
        );
      case Routes.editTaskScreen:
        return MaterialPageRoute(
          builder: (_) => EditTaskScreen(
            editTaskResponse: arg as EditTaskResponse,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(),
        );
    }
  }
}
