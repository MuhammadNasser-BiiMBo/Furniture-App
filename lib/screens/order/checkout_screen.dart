import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/cubit/main_cubit/main_states.dart';
import 'package:furnitured/screens/shipping_address/shipping_address_screen.dart';
import 'package:furnitured/widgets/app_button.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../widgets/back_icon.dart';
import '../../widgets/big_text.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Back(),
                BigText(
                  text: 'Check out',
                  weight: FontWeight.w700,
                  size: 16.sp,
                  spacing: 0,
                  color: AppColors.appPrimary,
                ),
                SizedBox(
                  width: 30.sp,
                ),
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 2.h,
            ),
            child: Column(
              children: [
                // shipping address field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: 'Shipping Address',
                      spacing: 0,
                      color: AppColors.appGrey,
                      weight: FontWeight.w600,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, ShippingAddressScreen());
                      },
                      child: const Icon(
                        Icons.mode_edit_outline,
                        size: 28,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 1.5.h,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.sp),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.sp,
                        spreadRadius: 0,
                        color: AppColors.shadowColor,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        child: BigText(
                          text: mainCubit.user!.address!.fullName!,
                          spacing: 0,
                          size: 14.sp,
                          weight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 1.5.h,
                        ),
                        height: 2,
                        width: double.maxFinite,
                        color: AppColors.appBlurGrey,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        child: SmallText(
                          text:
                              '${mainCubit.user!.address!.address}, ${mainCubit.user!.address!.city}, ${mainCubit.user!.address!.postalCode}, ${mainCubit.user!.address!.district}, ${mainCubit.user!.address!.country}',
                          spacing: 0,
                          weight: FontWeight.w600,
                          size: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                // payment method field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: 'Payment Method',
                      spacing: 0,
                      color: AppColors.appGrey,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 13.5.h,
                  padding:
                      EdgeInsets.symmetric(vertical: 1.h, horizontal: 20.w),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.sp),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.sp,
                        spreadRadius: 0,
                        color: AppColors.shadowColor,
                      ),
                    ],
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        mainCubit.changePaymentIndex(index);
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 50.sp,
                            height: 50.sp,
                            padding: EdgeInsets.all(6.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.sp),
                              color: mainCubit.paymentMethodIndex == index
                                  ? AppColors.appBlack
                                  : AppColors.appCat,
                            ),
                            child: Center(
                              child: Image(
                                width: index == 5 ? 30.sp : null,
                                color: mainCubit.paymentMethodIndex == index
                                    ? Colors.white
                                    : AppColors.appPrimary,
                                image: AssetImage(
                                  paymentImages[index],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          SmallText(
                            text: paymentLabels[index],
                            color: mainCubit.paymentMethodIndex == index
                                ? AppColors.appPrimary
                                : AppColors.appGrey,
                            size: 12.sp,
                            weight: FontWeight.w500,
                            spacing: 0,
                          )
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 15.w),
                    itemCount: paymentLabels.length,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                // Delivery Method field
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: 'Delivery Method',
                      spacing: 0,
                      color: AppColors.appGrey,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 5.w),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.sp),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.sp,
                        spreadRadius: 0,
                        color: AppColors.shadowColor,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Image(
                        image: Svg('assets/icons/dhl.svg'),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      SmallText(
                        text: 'Fast ( 2 - 3 days )',
                        spacing: 0,
                        weight: FontWeight.w500,
                        color: AppColors.appPrimary,
                        size: 11.sp,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                // order price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      text: 'Payment Method',
                      spacing: 0,
                      color: AppColors.appGrey,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                  height: 15.h,
                  padding: EdgeInsets.symmetric(
                    vertical: 1.h,
                    horizontal: 5.w,
                  ),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.sp),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10.sp,
                        spreadRadius: 0,
                        color: AppColors.shadowColor,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: 'Order:',
                            spacing: 0,
                            color: AppColors.appGrey,size: 13.sp
                          ),
                          BigText(
                            text: '\$ ${mainCubit.cartTotal()}.00',
                            spacing: 0,
                            color: AppColors.appPrimary,
                            weight: FontWeight.w700,size: 13.sp
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: 'Delivery:',
                            spacing: 0,
                            color: AppColors.appGrey,size: 13.sp
                          ),
                          BigText(
                            text: '\$ 5.00',
                            spacing: 0,
                            color: AppColors.appPrimary,
                            weight: FontWeight.w700,size: 13.sp
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: 'Total:',
                            spacing: 0,
                            color: AppColors.appGrey,size: 13.sp
                          ),
                          BigText(
                            text: '\$ ${mainCubit.cartTotal()+5}.00',
                            spacing: 0,
                            color: AppColors.appPrimary,
                            weight: FontWeight.w700,size: 13.sp
                            ,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                AppButton(text: 'Submit Order',onPressed: (){},buttonWidth: 90.w,buttonHeight: 15.w,radius: 5.sp,)
              ],
            ),
          ),
        );
      },
    );
  }
}
