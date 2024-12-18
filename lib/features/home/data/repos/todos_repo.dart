import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/home/data/models/todos_response.dart';

class TodosRepo {
  TodosRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<List<TodosResponse>>> getTodos(int page) async {
    try {
      final response = await _apiService.getTodos(page);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
