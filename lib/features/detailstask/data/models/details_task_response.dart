import 'package:freezed_annotation/freezed_annotation.dart';
part 'details_task_response.g.dart';

@JsonSerializable()
class DetailsTaskResponse {
  DetailsTaskResponse({
    required this.id,
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    required this.status,
    required this.user,
    required this.createdAt,
    required this.updatedAt,
  });
  factory DetailsTaskResponse.fromJson(Map<String, dynamic> json) =>
      _$DetailsTaskResponseFromJson(json);
  @JsonKey(name: '_id')
  final String id;
  final String image;
  final String title;
  final String desc;
  final String priority;
  final String status;
  final String user;
  final String createdAt;
  final String updatedAt;
}
