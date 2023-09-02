import 'package:flutter/material.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:sizer/sizer.dart';

class AppButton extends StatelessWidget {
  final String text;
  String family;
  VoidCallback? onPressed;
  double buttonHeight;
  double? buttonWidth;
  double radius;
  AppButton({
    super.key,
    this.onPressed,
    this.buttonHeight = 50,
    this.radius = 5,
    this.buttonWidth,
    this.family = 'nunito',
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      width: buttonWidth ?? 70.w,
      decoration: BoxDecoration(
        color: onPressed == null ? AppColors.appDisabled : AppColors.appPrimary,
        borderRadius: BorderRadius.circular(radius),
          boxShadow: const [
            BoxShadow(spreadRadius: 3,blurRadius: 10,color: Colors.black12,)
          ]
      ),
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Center(
            child: BigText(
              text: text,
              color: Colors.white,
              family: family,
              spacing: 0,
              weight: FontWeight.w600,
              size: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
