// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskResponse _$EditTaskResponseFromJson(Map<String, dynamic> json) =>
    EditTaskResponse(
      image: json['image'] as String?,
      title: json['title'] as String?,
      id: json['id'] as String?,
      desc: json['desc'] as String?,
      priority: json['priority'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$EditTaskResponseToJson(EditTaskResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'id': instance.id,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
