import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/addtask/data/models/add_task_request.dart';

class AddTaskRepo {
  AddTaskRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<void>> addTask({required AddTaskRequest body}) async {
    try {
      final response = await _apiService.createTodo(body);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
