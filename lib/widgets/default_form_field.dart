import 'package:flutter/material.dart';
import 'package:furnitured/constants/colors.dart';

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
  DefaultFormField(
      {
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
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isClickable,
      style: const TextStyle(
          fontFamily: 'nunito', fontSize: 20, color: AppColors.appPrimary),
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
        // alignLabelWithHint: true,
        focusColor: AppColors.appGrey,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.appFormFieldBorder,
            width: 2,
          ),
        ),
      ),
    );
  }
}
