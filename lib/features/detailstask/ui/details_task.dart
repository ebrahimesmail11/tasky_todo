import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky_todo/core/di/dependency_injection.dart';
import 'package:tasky_todo/features/detailstask/cubit/details_task_cubit.dart';
import 'package:tasky_todo/features/detailstask/ui/widgets/details_task_body.dart';

import 'widgets/details_app_bar.dart';

class DetailsTaskScreen extends StatelessWidget {
  const DetailsTaskScreen({required this.id, super.key});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailsTaskCubit>()..detailsTask(id),
      child: BlocBuilder<DetailsTaskCubit, DetailsTaskState>(
        builder: (context, state) {
          return state.when(
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              success: (data) {
                return Scaffold(
                  appBar: DetailsAppBar(
                    title: data.title,
                  ),
                  body: SingleChildScrollView(
                    child: DetailsTaskBody(
                      detailsTask: data,
                    ),
                  ),
                );
              },
              failure: Text.new);
        },
      ),
    );
  }
}
