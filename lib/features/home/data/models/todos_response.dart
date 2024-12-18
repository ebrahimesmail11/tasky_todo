import 'package:freezed_annotation/freezed_annotation.dart';
part 'todos_response.g.dart';

@JsonSerializable()
class TodosResponse {
  TodosResponse({
    this.id,
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
  });
  factory TodosResponse.fromJson(Map<String, dynamic> json) =>
      _$TodosResponseFromJson(json);
  @JsonKey(name: '_id')
  String? id;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  String? createdAt;
  String? updatedAt;
} 
