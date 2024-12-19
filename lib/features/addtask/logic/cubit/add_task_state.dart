part of 'add_task_cubit.dart';

@freezed
class AddTaskState with _$AddTaskState {
  const factory AddTaskState.initial() = _Initial;
  const  factory AddTaskState.loading() = Loading;
  const factory AddTaskState.success() = Success;
  const factory AddTaskState.failure({required String error}) = Failure;
}
