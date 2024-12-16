import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/core/networking/services/dio_factory.dart';
import 'package:tasky_todo/features/signup/logic/sign_up_cubit.dart';
import 'package:tasky_todo/features/signup/data/repos/signup_repo.dart';

final getIt = GetIt.instance;
Future<void> setUpGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
}


