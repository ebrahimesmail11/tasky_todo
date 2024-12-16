import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_response_body.g.dart';
@JsonSerializable()
class LoginResponseBody {
  LoginResponseBody({this.id, this.accessToken, this.refreshToken});
  factory LoginResponseBody.fromJson(Map<String,dynamic> json )=> _$LoginResponseBodyFromJson(json);
   @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
}