import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  ProfileResponse(
    this.displayName,
    this.phoneNumber,
    this.experienceYears,
    this.address,
    this.level,
  );
  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);

  String? displayName;
  @JsonKey(name: 'username')
  String? phoneNumber;
  int? experienceYears;
  String? level;
  String? address;
}
