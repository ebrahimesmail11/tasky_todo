import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/features/addtask/data/models/add_task_request.dart';
import 'package:tasky_todo/features/addtask/data/repos/add_task_repo.dart';

part 'add_task_state.dart';
part 'add_task_cubit.freezed.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit(this._repo) : super(const AddTaskState.initial());
  final AddTaskRepo _repo;
  Future<void> addTask({required AddTaskRequest body}) async {
    emit(const AddTaskState.loading());
    final result = await _repo.addTask(body: body);
    result.when(success: (data) {
      emit(const AddTaskState.success());
    }, failure: (error) {
      emit(AddTaskState.failure(error: error.apiErrorModel.message ?? ''));
    });
  }
}
