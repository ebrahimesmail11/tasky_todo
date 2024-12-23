import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tasky_todo/core/helpers/images_manger.dart';
import 'package:tasky_todo/core/helpers/spacing.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';

class CustomRowDropButton<T> extends StatefulWidget {
  const CustomRowDropButton({
    required this.containerColor,
    required this.displayName,
    required this.apiValue,
    required this.values,
    required this.onValueSelected,
     this.flagImage,
    required this.initialValue,
    required this.textColor,
    super.key,
  });
  final T initialValue;
  final List<T> values;
  final String Function(T) displayName;
  final String Function(T) apiValue;
  final Color Function(T) containerColor;
  final String Function(T)? flagImage;
  final Color Function(T) textColor;
  final void Function(T) onValueSelected;
  @override
  State<CustomRowDropButton<T>> createState() => _CustomRowDropButtonState<T>();
}

class _CustomRowDropButtonState<T> extends State<CustomRowDropButton<T>> {
  late T selectedValue;
   @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue; // Initialize selectedValue with the initialValue
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTapDown: (details) async {
        FocusScope.of(context).requestFocus( FocusNode());
        selectedValue = await showPopupMenu(context, details.globalPosition);
        widget.onValueSelected(selectedValue);
        setState(() {});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: widget.containerColor(selectedValue),
            borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          children: [
            widget.flagImage != null
                ? SvgPicture.asset(widget.flagImage!(selectedValue))
                : const SizedBox(),
            horizontalSpace(10),
            Text(
              widget.displayName(selectedValue),
              style: TextStyles.font12MainPurpleMedium
                  .copyWith(color: widget.textColor(selectedValue)),
            ),
            const Spacer(),
            SvgPicture.asset(IconsManager.arrowDown),
          ],
        ),
      ),
    );
  }

  Future<T> showPopupMenu(BuildContext context, Offset position) async {
    final RenderBox overlay =
        Overlay.of(context).context.findRenderObject() as RenderBox;

    return await showMenu<T>(
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      context: context,
      color: ColorsManager.containerMain,
      position: RelativeRect.fromRect(
        position & const Size(40, 40),
        Offset.zero & overlay.size,
      ),
      items: widget.values.map((value) {
        return PopupMenuItem<T>(
          value: value,
          child: Text(widget.displayName(value)),
        );
      }).toList(),
      elevation: 8.0,
    ).then((value) {
      return value ?? widget.initialValue;
    });
  }
}
