import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/screens/cart/cart_screen.dart';
import 'package:sizer/sizer.dart';
import '../constants/constants.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, const CartScreen());
      },
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: const Image(
          color: AppColors.appPrimary,
          image: Svg(Constants.cart,),
        ),
      ),
    );
  }
}
