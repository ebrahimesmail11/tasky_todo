import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/detailstask/data/models/details_task_response.dart';

class DetailsTaskRepo {
  DetailsTaskRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<DetailsTaskResponse>> detailsTask(String id) async {
    try{
      final response = await _apiService.detailsTask(id);
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
  Future<ApiResult<void>> deleteTask(String id) async {
    try{
      final response = await _apiService.deleteTask(id);
      return ApiResult.success(response);
    }catch(e){
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}