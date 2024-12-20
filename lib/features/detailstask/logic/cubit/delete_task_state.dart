part of 'delete_task_cubit.dart';

@freezed
class DeleteTaskState with _$DeleteTaskState {
  const factory DeleteTaskState.initial() = _Initial;
  const factory DeleteTaskState.loading()= Loading;
  const factory DeleteTaskState.success()= Success;
  const factory DeleteTaskState.failure({required String error})= Failure;
}
