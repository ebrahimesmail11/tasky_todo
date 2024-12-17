import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/core/networking/services/dio_factory.dart';
import 'package:tasky_todo/features/login/logic/login_cubit.dart';
import 'package:tasky_todo/features/login/data/repos/login_repo.dart';
import 'package:tasky_todo/features/profile/logic/profile_cubit.dart';
import 'package:tasky_todo/features/profile/data/repo/profile_repo.dart';
import 'package:tasky_todo/features/signup/logic/sign_up_cubit.dart';
import 'package:tasky_todo/features/signup/data/repos/signup_repo.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  getIt.registerLazySingleton<LoginRepo>(
    () => LoginRepo(
      getIt(),
    ),
  );
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  getIt.registerFactory<ProfileCubit>(()=>ProfileCubit(getIt()));
}
