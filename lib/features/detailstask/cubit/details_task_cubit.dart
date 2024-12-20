import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/features/detailstask/data/models/details_task_response.dart';
import 'package:tasky_todo/features/detailstask/data/repos/details_task_repo.dart';

part 'details_task_state.dart';
part 'details_task_cubit.freezed.dart';

class DetailsTaskCubit extends Cubit<DetailsTaskState> {
  DetailsTaskCubit(this._repo) : super(const DetailsTaskState.loading());
  final DetailsTaskRepo _repo;
  Future<void> detailsTask(String id) async {
    emit(const DetailsTaskState.loading());
    final result = await _repo.detailsTask(id);
    result.when(success: (data) {
      emit(DetailsTaskState.success(detailsTask: data));
    }, failure: (error) {
      emit(DetailsTaskState.failure(error: error.apiErrorModel.message ?? ''));
    });
  }
}
