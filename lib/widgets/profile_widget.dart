import 'package:flutter/material.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

class ProfileWidget extends StatelessWidget {
  VoidCallback? onPressed;
  final String title;
  final String text;
  ProfileWidget({super.key, required this.title, required this.text,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:5.w),
        width: double.maxFinite,
        height: 10.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.sp),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowColor,
              blurRadius: 10,
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(
                    text: title,
                    spacing: 0,
                    weight: FontWeight.w700,
                  ),
                  SmallText(
                    text: text,
                    spacing: 0,
                    height: 0,
                    weight: FontWeight.w600,
                    size: 10.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
