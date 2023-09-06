import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/models/product_model.dart';
import 'package:furnitured/screens/product/product_details_screen.dart';
import 'package:furnitured/widgets/back_icon.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../cubit/main_cubit/main_cubit.dart';
import '../../cubit/main_cubit/main_states.dart';
import '../../widgets/app_button.dart';
import '../../widgets/big_text.dart';
import '../../widgets/cart_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        var cartItems = mainCubit.cart;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Back(),
                BigText(
                  text: 'My cart',
                  weight: FontWeight.w600,
                  size: 18.sp,
                  spacing: 0,
                  color: AppColors.appPrimary,
                ),
                SizedBox(
                  width: 30.sp,
                ),
              ],
            ),
          ),
          body: ConditionalBuilder(
            condition: cartItems.isNotEmpty,
            fallback: (context) => Center(
              child: Center(
                child: BigText(
                    text: 'Your cart is Empty !!',
                    spacing: 0,
                    weight: FontWeight.w700,
                    size: 20.sp),
              ),
            ),
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 5.w),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ProductModel model = ProductModel(
                        id: cartItems[index].id,
                        name: cartItems[index].name,
                        price: cartItems[index].price,
                        img: cartItems[index].img,
                        reviews: cartItems[index].reviews,
                        desc: cartItems[index].desc,
                        rate: cartItems[index].rate,
                      );
                      navigateTo(context, ProductDetailsScreen(product: model));
                    },
                    child: CartWidget(
                      product: cartItems[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Container(
                    height: 1,
                    width: double.maxFinite,
                    color: AppColors.appBlurGrey,
                  );
                },
                itemCount: cartItems.length,
              ),
            ),
          ),
          bottomNavigationBar: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 20.h,
            padding: EdgeInsets.symmetric(
              horizontal: 5.w,
              vertical: 3.h,
            ),
            decoration: BoxDecoration(
                color: AppColors.appBlurGrey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    40.sp,
                  ),
                  topRight: Radius.circular(
                    40.sp,
                  ),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigText(
                        text: 'Total',
                        spacing: 0,
                        color: AppColors.appGrey,
                        weight: FontWeight.w700,
                        size: 16.sp,
                      ),
                      BigText(
                        text: '\$ ${mainCubit.cartTotal()}.00',
                        spacing: 0,
                        color: AppColors.appPrimary,
                        weight: FontWeight.w700,
                        size: 17.sp,
                      ),
                    ],
                  ),
                ),
                AppButton(
                  text: 'Check out',
                  buttonWidth: 90.w,
                  buttonHeight: 45.sp,
                  radius: 5.sp,
                  onPressed: cartItems.isEmpty ? null : () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
