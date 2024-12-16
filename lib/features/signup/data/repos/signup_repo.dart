import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/signup/data/models/signup_request_body.dart';
import 'package:tasky_todo/features/signup/data/models/signup_response_body.dart';

class SignupRepo {
  SignupRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<SignupResponseBody>> signUp(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signUp(signupRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
