import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_request_body.g.dart';
@JsonSerializable()
class SignupRequestBody {
  SignupRequestBody({
    required this.displayName,
    required this.phone,
    required this.password,
    required this.address,
    required this.experienceYears,
    required this.level,
  });
  Map<String,dynamic> toJson() => _$SignupRequestBodyToJson(this);
  final String displayName;
  final String phone;
  final String password;
  final int experienceYears;
  final String address;
  final String level;
}