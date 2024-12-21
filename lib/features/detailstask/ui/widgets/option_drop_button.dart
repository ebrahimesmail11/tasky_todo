import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/routing/routes.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/font_weight_helper.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/custom_shap_painter.dart';
import 'package:tasky_todo/features/detailstask/logic/cubit/delete_task_cubit.dart';
import 'package:tasky_todo/features/edit_task/data/models/edit_task_response.dart';

class OptionDropButton extends StatefulWidget {
  const OptionDropButton({required this.editTaskResponse,required this .id ,  super.key});
  final String id;
  final EditTaskResponse editTaskResponse;
  @override
  State<OptionDropButton> createState() => _OptionDropButtonState();
}

class _OptionDropButtonState extends State<OptionDropButton> {
  final GlobalKey _menuKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showCustomMenu(context, _overlayEntry, widget.editTaskResponse, widget.id),
      color: ColorsManager.textBlack,
      key: _menuKey,
      iconSize: 25.h,
      icon: const Icon(Icons.more_vert),
    );
  }
}

void _showCustomMenu(
  BuildContext context,
  OverlayEntry? overlayEntry,
  editTaskResponse,
  id,
) {
  if (overlayEntry != null) {
    overlayEntry.remove();
    overlayEntry = null;
  } else {
    overlayEntry = OverlayEntry(
      builder: (BuildContext overlayContext) {
        return GestureDetector(
          onTap: () {
            overlayEntry!.remove();
            overlayEntry = null;
          },
          child: Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned(
                  right: 10.w,
                  top: 40.h,
                  width: 90.w,
                  child: GestureDetector(
                    onTap: () {},
                    child: Material(
                      color: Colors.transparent,
                      child: CustomPaint(
                        painter: CustomShapePainter(),
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  overlayEntry?.remove();
                                  context.pushNamed(Routes.editTaskScreen,
                                      arguments:editTaskResponse,);
                                },
                                child: SizedBox(
                                  height: 40.h,
                                  child: Center(
                                    child: Text(
                                      'Edit',
                                      style:
                                          TextStyles.font16BlackBold.copyWith(
                                        fontWeight: FontWeightHelper.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                endIndent: 10,
                                indent: 10,
                              ),
                              InkWell(
                                onTap: () async {
                                  // استخدم `context` الصحيح هنا
                                  await context
                                      .read<DeleteTaskCubit>()
                                      .deleteTask(id);
                                  overlayEntry!.remove();
                                  if (!context.mounted) return;
                                  context.pop();
                                },
                                child: SizedBox(
                                  height: 40,
                                  child: Text(
                                    'Delete',
                                    style: TextStyles.font16BlackBold.copyWith(
                                      fontWeight: FontWeightHelper.bold,
                                      color: ColorsManager.textLightRed,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    Overlay.of(context).insert(overlayEntry!);
  }
}
