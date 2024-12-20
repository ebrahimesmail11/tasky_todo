import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/features/detailstask/data/repos/details_task_repo.dart';

part 'delete_task_state.dart';
part 'delete_task_cubit.freezed.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  DeleteTaskCubit(this._repo) : super(const DeleteTaskState.initial());
  final DetailsTaskRepo _repo;
  Future<void> deleteTask(String id) async {
    emit(const DeleteTaskState.loading());
    final result = await _repo.deleteTask(id);
    result.when(success: (data) {
      emit(const DeleteTaskState.success());
    }, failure: (error) {
      emit(DeleteTaskState.failure(error: error.apiErrorModel.message ?? ''));
    });
  }
}
