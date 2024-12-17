import 'package:dio/dio.dart';
import 'package:tasky_todo/core/helpers/local_storage_helper.dart';
import 'package:tasky_todo/core/networking/services/api_constants.dart';
import 'package:tasky_todo/core/networking/services/api_service.dart';
import 'package:tasky_todo/core/networking/services/dio_factory.dart';

class AppInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(options, handler) {
    handler.next(options);
  }

  @override
  void onError(err, handler) async {
    if (err.response?.statusCode == 401) {
      final refreshToken =
          await LocalStorageHelper.read(ApiConstants.refreshToken);
      if (refreshToken != null) {
        final success = await _refreshToken(refreshToken);
        if (success) {
          FormData? newFormData;
          final requestOptions = err.response?.requestOptions;
          if (requestOptions!.data is FormData) {
            newFormData = requestOptions.data.clone();
          }
          if (requestOptions != null) {
            final response = await DioFactory.getDio().request(
              requestOptions.baseUrl + requestOptions.path,
              options: Options(
                method: requestOptions.method,
              ),
              data: requestOptions.data is FormData
                  ? newFormData
                  : requestOptions.data,
              queryParameters: requestOptions.queryParameters,
            );
            return handler.resolve(response);
          }
        }
      }
    }
    return super.onError(err, handler);
  }

  Future<bool> _refreshToken(String refreshToken) async {
    try {
      final apiService = ApiService(DioFactory.getDio());
      final response = await apiService.refreshToken(refreshToken);
      final accessToken = response.accessToken;
      if (accessToken != null) {
        await LocalStorageHelper.write(ApiConstants.accessToken, accessToken);
        DioFactory.setToken(accessToken);
        return true;
      }
    } catch (e) {}
    return false;
  }
}
