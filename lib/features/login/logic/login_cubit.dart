import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/core/helpers/local_storage_helper.dart';
import 'package:tasky_todo/core/networking/services/api_constants.dart';
import 'package:tasky_todo/core/networking/services/dio_factory.dart';
import 'package:tasky_todo/features/login/data/models/login_request_body.dart';
import 'package:tasky_todo/features/login/data/models/login_response_body.dart';
import 'package:tasky_todo/features/login/data/repos/login_repo.dart';

part 'login_state.dart';
part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._repo) : super(const LoginState.initial());
  final LoginRepo _repo;
  Future<void> login({required LoginRequestBody body}) async {
    emit(const LoginState.loading());
    final result = await _repo.login(body: body);
    result.when(
      success: (data) async {
        await saveUsersAccessToken(data.accessToken ?? '');
        await saveUsersRefreshToken(data.refreshToken ?? '');
        await saveUsersId(data.id ?? '');
        emit(LoginState.success(body: data));
      },
      failure: (error) {
        emit(LoginState.failure(error: error.apiErrorModel.message ?? ''));
      },
    );
  }

  Future<void> saveUsersAccessToken(String token) async {
    await LocalStorageHelper.write(ApiConstants.accessToken, token);
    return DioFactory.setToken(token);
  }

  Future<void> saveUsersRefreshToken(String token) async {
    await LocalStorageHelper.write(ApiConstants.refreshToken, token);
  }

  Future<void> saveUsersId(String id) async {
    await LocalStorageHelper.write(ApiConstants.userId, id);
  }
}
