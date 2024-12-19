// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTaskRequest _$AddTaskRequestFromJson(Map<String, dynamic> json) =>
    AddTaskRequest(
      title: json['title'] as String,
      image: json['image'] as String,
      desc: json['desc'] as String,
      priority: json['priority'] as String,
      dueDate: json['dueDate'] as String,
    );

Map<String, dynamic> _$AddTaskRequestToJson(AddTaskRequest instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'dueDate': instance.dueDate,
    };
