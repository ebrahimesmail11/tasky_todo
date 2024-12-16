import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_response_body.g.dart';

@JsonSerializable()
class SignupResponseBody {
  SignupResponseBody(
    this.id,
    this.name,
    this.accessToken,
    this.refreshToken,
  );
  factory SignupResponseBody.fromJson(Map<String,dynamic> json)=>_$SignupResponseBodyFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: "displayName")
  String? name;
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
}
