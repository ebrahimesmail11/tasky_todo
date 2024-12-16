// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestBody _$SignupRequestBodyFromJson(Map<String, dynamic> json) =>
    SignupRequestBody(
      displayName: json['displayName'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      address: json['address'] as String,
      experienceYears: (json['experienceYears'] as num).toInt(),
      level: json['level'] as String,
    );

Map<String, dynamic> _$SignupRequestBodyToJson(SignupRequestBody instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'phone': instance.phone,
      'password': instance.password,
      'experienceYears': instance.experienceYears,
      'address': instance.address,
      'level': instance.level,
    };
