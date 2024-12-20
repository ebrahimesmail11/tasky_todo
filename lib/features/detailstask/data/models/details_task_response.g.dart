// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailsTaskResponse _$DetailsTaskResponseFromJson(Map<String, dynamic> json) =>
    DetailsTaskResponse(
      id: json['_id'] as String,
      image: json['image'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      priority: json['priority'] as String,
      status: json['status'] as String,
      user: json['user'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$DetailsTaskResponseToJson(
        DetailsTaskResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
      'user': instance.user,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
