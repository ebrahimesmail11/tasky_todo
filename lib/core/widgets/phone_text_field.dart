import 'package:country_flags/country_flags.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:tasky_todo/core/theming/colors.dart';
import 'package:tasky_todo/core/theming/font_weight_helper.dart';
import 'package:tasky_todo/core/theming/styles.dart';
import 'package:tasky_todo/core/widgets/custom_input_decoration.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    required this.phoneController,
    this.validator,
    this.onChanged,
    super.key,
  });
  final TextEditingController phoneController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  String _selectedCountryCode = '20';

  String _selectedCountryFlag = 'eg';

  void _updatePhoneNumber(String phoneNumber) {
    final fullPhoneNumber = '+$_selectedCountryCode$phoneNumber';
    widget.onChanged?.call(fullPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.phoneController,
      validator: (phone) {
        if (!_validePhoneNumber('+$_selectedCountryCode${phone!}')) {
          return 'Please enter valid phone number';
        }
        return null;
      },
      onChanged: (value) {
        _updatePhoneNumber(value);
      },
      decoration: customInputDecoration('123 456-7890').copyWith(
        prefixIcon: GestureDetector(
          onTap: () {
            showCountryPicker(
              context: context,
              onSelect: (Country country) {
                setState(() {
                  _selectedCountryCode = country.countryCode;
                  _selectedCountryFlag = country.flagEmoji;
                  _updatePhoneNumber(widget.phoneController.text);
                });
              },
            );
          },
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CountryFlag.fromCountryCode(
                    shape: RoundedRectangle(7.r),
                    height: 24,
                    width: 24,
                    _selectedCountryFlag.toLowerCase()),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  '+$_selectedCountryCode',
                  style: TextStyles.font14GrayRegular
                      .copyWith(fontWeight: FontWeightHelper.bold),
                ),
                Icon(
                  MdiIcons.chevronDown,
                  size: 25,
                  color: ColorsManager.textDarkGrey,
                ),
              ],
            ),
          ),
        ),
      ),
      keyboardType: TextInputType.phone,
    );
  }
}

bool _validePhoneNumber(String value) {
  final phoneNumber = PhoneNumber.parse(value);
  final isValid = phoneNumber.isValid(type: PhoneNumberType.mobile);

  return isValid;
}
