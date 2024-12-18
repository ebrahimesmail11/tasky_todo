import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasky_todo/core/networking/services/api_constants.dart';
import 'package:tasky_todo/features/home/data/models/todos_response.dart';
import 'package:tasky_todo/features/login/data/models/login_request_body.dart';
import 'package:tasky_todo/features/login/data/models/login_response_body.dart';
import 'package:tasky_todo/features/login/data/models/refresh_token_response.dart';
import 'package:tasky_todo/features/profile/data/models/profile_response.dart';
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
  @GET(ApiConstants.refreshTooken)
  Future<RefreshTokenResponse> refreshToken(
    @Query('token') String refreshToken,
  );
  @GET(ApiConstants.profile)
  Future<ProfileResponse> getProfile();
  @GET(ApiConstants.getTodos)
  Future<List<TodosResponse>>getTodos(
    @Query('page') int page,
  );
}
