import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_task_response.g.dart';
@JsonSerializable()
class EditTaskResponse {
    EditTaskResponse({
    this.image,
    this.title,
    this.id,
    this.desc,
    this.priority,
    this.status,
    this.createdAt,
  });
  factory EditTaskResponse.fromJson(Map<String, dynamic> json)=>_$EditTaskResponseFromJson(json);
  final String? image;
  final String? title;
  final String? id;
  final String? desc;
  final String? priority;
  final String? status;
  final String? createdAt;

}
