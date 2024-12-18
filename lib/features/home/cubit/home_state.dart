part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success({
    required List<TodosResponse> todos,
  }) = Success;
  const factory HomeState.failure({required String error}) = Failure;
  const factory HomeState.changeStatusCategory(
      {required String category,
      required List<TodosResponse> filteredItems}) = ChangeStatusCategory;
}
