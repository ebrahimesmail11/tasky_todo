import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:tasky_todo/core/helpers/constants.dart';
import 'package:tasky_todo/core/helpers/enums.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/custom_input_decoration.dart';

class ExperienceLevelDropDown extends StatelessWidget {
  const ExperienceLevelDropDown({required this.textEditingController,super.key});
final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DropdownButtonFormField(
        isExpanded: true,
        isDense: true,
        validator: (p0) {
          return null;
        },
        onChanged: (value) {
          textEditingController.text = experienceLevelsMap[value]!;
        },
        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            AppConstants.chooseExperienceLevel,
            style: TextStyles.font14LightGrayRegular.copyWith(
                color: ColorsManager.textBlack, fontWeight: FontWeight.w600),
          ),
        ),
        decoration: customInputDecoration(AppConstants.chooseExperienceLevel),
        icon: Icon(
          MdiIcons.chevronDown,
          color: ColorsManager.textFieldBorderGrey,
          size: 30,
        ),
        items: getDropdownItems(),
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems() {
    return experienceLevelsDisplay.map(
      (e) => DropdownMenuItem(
        value: e,
        child: Text(e),
      ),
    ).toList();
  }
}
