import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky_todo/core/networking/services/api_constants.dart';
import 'package:tasky_todo/features/login/data/models/login_request_body.dart';
import 'package:tasky_todo/features/login/data/models/login_response_body.dart';
import 'package:tasky_todo/features/signup/data/models/signup_request_body.dart';
import 'package:tasky_todo/features/signup/data/models/signup_response_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.signup)
  Future<SignupResponseBody> signUp(
    @Body() SignupRequestBody signupRequestBody,
  );
  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(
    @Body() LoginRequestBody loginRequestBody,
  );
}
