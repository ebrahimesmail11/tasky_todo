import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/core/networking/image_picker.dart';
import 'package:tasky_todo/features/addtask/data/repos/upload_image_repo.dart';

part 'upload_image_state.dart';
part 'upload_image_cubit.freezed.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._repo) : super(const UploadImageState.initial());
  final UploadImageRepo _repo;
   String get imageUrl => getimageUrl;
  String  getimageUrl = "";
  Future<void> uploadImage() async {
        emit(const UploadImageState.loading());
    final pickedImage = await PickImage().pickImage();
    if (pickedImage == null) {
      emit(const UploadImageState.failure(error: 'No image selected'));
      return;
    }
   

    final result = await _repo.uploadImage(pickedImage);
    result.when(
      success: (response) {
        getimageUrl = 'https://todo.iraqsapp.com/images/${response.image}';
        emit(const UploadImageState.success());
      },
      failure: (error) => emit(
          UploadImageState.failure(error: error.apiErrorModel.message ?? '')),
    );
  }
}
