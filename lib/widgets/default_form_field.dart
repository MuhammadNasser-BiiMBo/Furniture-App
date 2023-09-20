import 'package:flutter/material.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:sizer/sizer.dart';

class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  Function? onSubmit;
  final String label;
  IconData? prefix;
  final Function validate;
  bool isPassword;
  IconData? suffix;
  VoidCallback? suffixPressed;
  bool isClickable;
  String? value;
  DefaultFormField({
    super.key,
    required this.controller,
    required this.type,
    required this.label,
    required this.validate,
    this.isClickable = true,
    this.isPassword = false,
    this.onSubmit,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 3.w,
        vertical: 0.5.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.sp),
        border: Border.all(
          color: AppColors.appFormFieldBorder,
          width: 2,
        ),
      ),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        enabled: isClickable,
        initialValue: value,
        style: const TextStyle(
          fontFamily: 'nunito',
          fontSize: 20,
          color: AppColors.appPrimary,
        ),
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        onFieldSubmitted: (s) {
          onSubmit!();
        },
        validator: (value) {
          return validate(value);
        },
        smartDashesType: SmartDashesType.enabled,
        cursorColor: AppColors.appGrey,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          prefixIcon: prefix != null ? Icon(prefix) : null,
          suffixIcon: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: suffixPressed,
                )
              : null,
          labelStyle: const TextStyle(
            height: 1,
            color: AppColors.appGrey,
            fontFamily: 'nunito',
            fontSize: 20,
          ),
          focusColor: AppColors.appGrey,
        ),
      ),
    );
  }
}
