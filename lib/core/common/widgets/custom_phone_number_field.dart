import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practics/core/utils/constants/app_sizer.dart';
import '../../utils/constants/app_colors.dart';

class CustomPhoneNumberField extends StatelessWidget {
  const CustomPhoneNumberField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onCountryChange,
    this.validator,
    this.radius = 4,
    this.fillColor,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String hintText;
  final void Function(CountryCode)? onCountryChange;
  final String? Function(String?)? validator;
  final double radius;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: inputFormatters,
      style: GoogleFonts.poppins(
        fontSize: 14.sp,
        color: AppColors.textPrimary,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: CountryCodePicker(
            onChanged: onCountryChange,
            initialSelection: 'US',
            favorite: ['+1', 'US'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
            padding: EdgeInsets.zero,
            textStyle: GoogleFonts.poppins(
              // <<=== Country Picker Text
              color: AppColors.textPrimary,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w400,
        ),
        filled: true,
        fillColor: fillColor ?? AppColors.primary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColors.textFormFieldBorder,
            width: 0.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(
            color: AppColors.textFormFieldBorder,
            width: 0.5,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        errorStyle: GoogleFonts.poppins(
          color: Colors.redAccent,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      validator: validator,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
    );
  }
}
