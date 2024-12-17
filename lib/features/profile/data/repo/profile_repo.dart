import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/profile/data/models/profile_response.dart';

class ProfileRepo {
  ProfileRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<ProfileResponse>> getProfile() async {
    try {
      final response = await _apiService.getProfile();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
