import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/addtask/data/models/upload_image_response.dart';

class UploadImageRepo {
  UploadImageRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<UploadImageResponse>> uploadImage(File file) async {
    final formData = FormData();
    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(file.path),
      ),
    );
    try {
      final response = await _apiService.uploadImage(formData);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
