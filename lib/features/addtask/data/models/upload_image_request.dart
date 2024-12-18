import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload_image_request.g.dart';
@JsonSerializable()
class UploadImageRequest {
UploadImageRequest({required this.image});
Map<String,dynamic> toJson()=>_$UploadImageRequestToJson(this);
final String image;

}