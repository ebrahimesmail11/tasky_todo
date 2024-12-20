import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasky_todo/core/helpers/extensions.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/font_weight_helper.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/custom_shap_painter.dart';

class OptionDropButton extends StatefulWidget {
  const OptionDropButton({super.key});

  @override
  State<OptionDropButton> createState() => _OptionDropButtonState();
}

class _OptionDropButtonState extends State<OptionDropButton> {
  final GlobalKey _menuKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => _showCustomMenu(context, _overlayEntry),
      color: ColorsManager.textBlack,
      key: _menuKey,
      iconSize: 25.h,
      icon: const Icon(Icons.more_vert),
    );
  }
}

void _showCustomMenu(context, overlayEntry) {
  if (overlayEntry != null) {
    overlayEntry!.remove();
    overlayEntry = null;
  } else {
    overlayEntry = OverlayEntry(
      builder: (context) {
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
                                onTap: () {
                                  overlayEntry!.remove();
                                  context.pop();
                                },
                                child: SizedBox(
                                  height: 40,
                                  child: Text(
                                    'Delete',
                                    style: TextStyles.font16BlackBold.copyWith(
                                        fontWeight: FontWeightHelper.bold,
                                        color: ColorsManager.textLightRed),
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
