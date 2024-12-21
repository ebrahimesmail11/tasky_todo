import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/features/edit_task/data/models/edit_task_request.dart';

import 'package:tasky_todo/features/edit_task/data/repos/edit_task_repo.dart';

part 'edit_task_state.dart';
part 'edit_task_cubit.freezed.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(this._repo) : super(const EditTaskState.initial());
  final EditTaskRepo _repo;
  Future<void> editTask({required String id,required EditTaskRequest body}) async {
    emit(const EditTaskState.loading());
    final result = await _repo.editTask(id, body);
    result.when(success: (data) {
      emit(const EditTaskState.success());
    }, failure: (error) {
      emit(EditTaskState.failure(error: error.apiErrorModel.message ?? ''));
    });
  }
}
