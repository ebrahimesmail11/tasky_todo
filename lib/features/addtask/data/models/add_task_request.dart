import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_task_request.g.dart';

@JsonSerializable()
class AddTaskRequest {
  AddTaskRequest({
    required this.title,
    required this.image,
    required this.desc,
    required this.priority,
    required this.dueDate,
  });
  Map<String,dynamic> toJson()=>_$AddTaskRequestToJson(this);
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String dueDate;
}
