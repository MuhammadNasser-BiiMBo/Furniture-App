import 'package:flutter/material.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/constants/constants.dart';
import 'package:furnitured/screens/authentication/login_screen.dart';
import 'package:furnitured/widgets/app_button.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';


class BoardingScreen extends StatelessWidget {
  const BoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // The Onboarding Image.
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                Constants.boardingImage,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Big Texts.
            Container(
              padding: EdgeInsets.only(top: 27.h,left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: 'MAKE YOUR',
                    size: 18.sp,
                    weight: FontWeight.w600,
                    color: const Color(0xFF606060),
                    family: 'Gelasio',spacing: 1.2,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  BigText(
                    text: 'HOME BEAUTIFUL',
                    size: 22.sp,
                    weight: FontWeight.w700,
                    spacing: 1.3,
                    color: AppColors.appBlack,
                    family: "Gelasio",
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  // centered text.
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Center(
                      child: SmallText(
                        text:
                        'The best simple place where you discover most wonderful furniture and make your home beautiful.',
                        size: 13.sp,
                        weight: FontWeight.w400,
                        spacing: 1.3,
                        height: 2,
                        color: const Color(0xFF808080),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            // button.
            Center(
              child: AppButton(
                onPressed: (){
                  navigateAndFinish(context, LoginScreen());
                },
                buttonWidth: 40.w,
                buttonHeight: 7.h,
                family: "Gelasio",text: 'Get Started',
              ),
            )
          ],
        ),
      ),
    );
  }
}
