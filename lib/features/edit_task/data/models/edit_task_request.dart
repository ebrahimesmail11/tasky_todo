import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_task_request.g.dart';

@JsonSerializable()
class EditTaskRequest {
  EditTaskRequest({
    required this.image,
    required this.title,
    required this.desc,
    required this.status,
    required this.priority,
    required this.dueDate,
  });
  Map<String ,dynamic> toJson()=>_$EditTaskRequestToJson(this);
  final String image;
  final String title;
  final String desc;
  final String status;
  final String priority;
  final String dueDate;
}
