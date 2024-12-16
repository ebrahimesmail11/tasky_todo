import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/login/data/models/login_request_body.dart';
import 'package:tasky_todo/features/login/data/models/login_response_body.dart';

class LoginRepo {
  LoginRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<LoginResponseBody>> login(
      {required LoginRequestBody body}) async {
    try {
      final response = _apiService.login(body);
      return ApiResult.success(await response);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e),
      );
    }
  }
}
