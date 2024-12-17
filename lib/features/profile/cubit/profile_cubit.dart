import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tasky_todo/features/profile/data/models/profile_response.dart';
import 'package:tasky_todo/features/profile/data/repo/profile_repo.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._repo) : super(const ProfileState.initial());
  final ProfileRepo _repo;
  Future<void> getProfile() async {
    emit(const ProfileState.loading());
    final result = await _repo.getProfile();
    result.when(success: (data) {
      emit(ProfileState.success(profile: data));
    }, failure: (error) {
      emit(ProfileState.failure(error: error.apiErrorModel.message ?? ''));
    });
  }
}
