part of 'details_task_cubit.dart';

@freezed
class DetailsTaskState with _$DetailsTaskState {
  const factory DetailsTaskState.loading() = Loading;
  const factory DetailsTaskState.success({required DetailsTaskResponse detailsTask}) = Success;
  const factory DetailsTaskState.failure({required String error}) = Failure;

}
