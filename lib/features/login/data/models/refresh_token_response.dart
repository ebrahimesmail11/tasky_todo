import 'package:freezed_annotation/freezed_annotation.dart';
part 'refresh_token_response.g.dart';
@JsonSerializable()
class RefreshTokenResponse {
  RefreshTokenResponse({this.accessToken, this.refreshToken});
  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) =>_$RefreshTokenResponseFromJson(json);
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
}
