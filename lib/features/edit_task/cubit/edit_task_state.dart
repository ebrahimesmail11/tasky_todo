part of 'edit_task_cubit.dart';

@freezed
class EditTaskState with _$EditTaskState {
  const factory EditTaskState.initial() = _Initial;
  const factory EditTaskState.loading() = Loading;
  const factory EditTaskState.success() = Success;
  const factory EditTaskState.failure({
    required String error,
  }) = Failure;
}
