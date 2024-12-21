import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/core/networking/services/dio_factory.dart';
import 'package:tasky_todo/features/addtask/data/repos/add_task_repo.dart';
import 'package:tasky_todo/features/addtask/data/repos/upload_image_repo.dart';
import 'package:tasky_todo/features/addtask/logic/cubit/add_task_cubit.dart';
import 'package:tasky_todo/features/addtask/logic/upload/upload_image_cubit.dart';
import 'package:tasky_todo/features/detailstask/cubit/details_task_cubit.dart';
import 'package:tasky_todo/features/detailstask/data/repos/details_task_repo.dart';
import 'package:tasky_todo/features/detailstask/logic/cubit/delete_task_cubit.dart';
import 'package:tasky_todo/features/edit_task/cubit/edit_task_cubit.dart';
import 'package:tasky_todo/features/edit_task/data/repos/edit_task_repo.dart';
import 'package:tasky_todo/features/home/cubit/home_cubit.dart';
import 'package:tasky_todo/features/home/data/repos/todos_repo.dart';
import 'package:tasky_todo/features/login/logic/login_cubit.dart';
import 'package:tasky_todo/features/login/data/repos/login_repo.dart';
import 'package:tasky_todo/features/profile/logic/profile_cubit.dart';
import 'package:tasky_todo/features/profile/data/repo/profile_repo.dart';
import 'package:tasky_todo/features/signup/logic/sign_up_cubit.dart';
import 'package:tasky_todo/features/signup/data/repos/signup_repo.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  Dio dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();
  getIt
    ..registerLazySingleton<ApiService>(() => ApiService(dio))
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      getIt(),
    ),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt()));
  getIt.registerLazySingleton<TodosRepo>(() => TodosRepo(getIt()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  getIt.registerLazySingleton<UploadImageRepo>(() => UploadImageRepo(getIt()));
  getIt.registerFactory<UploadImageCubit>(() => UploadImageCubit(getIt()));
  getIt.registerLazySingleton<AddTaskRepo>(() => AddTaskRepo(getIt()));
  getIt.registerFactory<AddTaskCubit>(() => AddTaskCubit(getIt()));
  getIt.registerLazySingleton<DetailsTaskRepo>(() => DetailsTaskRepo(getIt()));
  getIt.registerFactory<DetailsTaskCubit>(() => DetailsTaskCubit(getIt()));
  getIt.registerFactory<DeleteTaskCubit>(() => DeleteTaskCubit(getIt()));
  getIt.registerLazySingleton<EditTaskRepo>(() => EditTaskRepo(getIt()));
  getIt.registerFactory<EditTaskCubit>(() => EditTaskCubit(getIt()));
}
