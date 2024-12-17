// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['displayName'] as String?,
      json['username'] as String?,
      (json['experienceYears'] as num?)?.toInt(),
      json['address'] as String?,
      json['level'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'username': instance.phoneNumber,
      'experienceYears': instance.experienceYears,
      'level': instance.level,
      'address': instance.address,
    };
