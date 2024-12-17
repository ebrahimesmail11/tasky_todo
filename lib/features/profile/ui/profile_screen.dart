import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/di/dependency_injection.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/widgets/custom_app_bar.dart';
import 'package:tasky_todo/features/profile/cubit/profile_cubit.dart';
import 'package:tasky_todo/features/profile/ui/widgets/profile_info_list_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getProfile(),
      child: Scaffold(
        appBar: const CustomAppBar(title: AppConstants.profile),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return state.whenOrNull(
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  success: (data) {
                    return ProfileInfoListView(
                      profile: data,
                    );
                  },
                  failure: (error) => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 50,
                        ),
                       verticalSpace(10),
                        Text(
                          'An error occurred: $error',
                          style:
                               TextStyle(color: Colors.red, fontSize: 16.sp),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ) ??
                const Center(
                  child: Text('Unexpected state encountered'),
                );
          },
        ),
      ),
    );
  }
}
