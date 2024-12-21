import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/edit_task/data/models/edit_task_request.dart';

class EditTaskRepo {
  EditTaskRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<void>> editTask(String id, EditTaskRequest body) async {
    try {
      final response= await _apiService.updateTask(id, body);
      return  ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(
        ErrorHandler.handle(e),
      );
    }
  }
}
