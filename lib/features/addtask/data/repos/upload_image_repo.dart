import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tasky_todo/core/helpers/local_storage_helper.dart';
import 'package:tasky_todo/core/networking/services/api_constants.dart';
import 'package:tasky_todo/core/networking/services/api_error_handler.dart';
import 'package:tasky_todo/core/networking/services/api_result.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/features/addtask/data/models/upload_image_response.dart';

class UploadImageRepo {
  UploadImageRepo(this._apiService);
  final ApiService _apiService;
  Future<ApiResult<UploadImageResponse>> uploadImage(XFile file) async {
    final data = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        file.path,
        filename: file.path.split(Platform.pathSeparator).last,
        contentType: DioMediaType.parse('image/jpeg'),
      ),
    });
    try {
      final token = await LocalStorageHelper.read(ApiConstants.accessToken);
      final authorization = 'Bearer $token';
      final response = await _apiService.uploadImage(data, authorization);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
