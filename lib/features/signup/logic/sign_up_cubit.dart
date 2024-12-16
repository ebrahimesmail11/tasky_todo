import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/core/helpers/local_storage_helper.dart';
import 'package:tasky_todo/core/networking/services/api_constants.dart';
import 'package:tasky_todo/core/networking/services/dio_factory.dart';
import 'package:tasky_todo/features/signup/data/models/signup_request_body.dart';
import 'package:tasky_todo/features/signup/data/repos/signup_repo.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._repo) : super(const SignUpState.initial());
  final SignupRepo _repo;
  Future<void> signUp(SignupRequestBody signupRequestBody) async {
    emit(const SignUpState.loading());
    final result = await _repo.signUp(signupRequestBody);
    result.when(
      success: (data) async {
        await saveUsersAccessToken(data.accessToken ?? '');
        await saveUsersRefreshToken(data.refreshToken ?? '');
        await saveUsersId(data.id ?? '');
        emit(SignUpState.success(body: signupRequestBody));
      },
      failure: (error) {
        emit(SignUpState.failure(error: error.apiErrorModel.message ?? ''));
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
