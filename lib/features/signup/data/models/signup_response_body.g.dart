// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseBody _$SignupResponseBodyFromJson(Map<String, dynamic> json) =>
    SignupResponseBody(
      json['_id'] as String?,
      json['displayName'] as String?,
      json['access_token'] as String?,
      json['refresh_token'] as String?,
    );

Map<String, dynamic> _$SignupResponseBodyToJson(SignupResponseBody instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'displayName': instance.name,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
