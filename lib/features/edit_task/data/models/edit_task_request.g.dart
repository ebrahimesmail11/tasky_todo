// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskRequest _$EditTaskRequestFromJson(Map<String, dynamic> json) =>
    EditTaskRequest(
      image: json['image'] as String,
      title: json['title'] as String,
      desc: json['desc'] as String,
      status: json['status'] as String,
      priority: json['priority'] as String,
      dueDate: json['dueDate'] as String,
    );

Map<String, dynamic> _$EditTaskRequestToJson(EditTaskRequest instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'status': instance.status,
      'priority': instance.priority,
      'dueDate': instance.dueDate,
    };
