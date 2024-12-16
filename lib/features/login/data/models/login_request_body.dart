import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request_body.g.dart';
@JsonSerializable()
class LoginRequestBody {
  LoginRequestBody({required this.phone, required this.password});
  Map<String ,dynamic> toJson() => _$LoginRequestBodyToJson(this);
  final String phone;
  final String password;
}