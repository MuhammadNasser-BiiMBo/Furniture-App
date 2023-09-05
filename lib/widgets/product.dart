import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/constants/constants.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/cubit/main_cubit/main_states.dart';
import 'package:furnitured/screens/product/product_details_screen.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';
import '../models/product_model.dart';

class Product extends StatelessWidget {
  final ProductModel product;
  const Product({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        var inCart = mainCubit.inCartItems.contains(product.id);
        return InkWell(
          onTap: () {
            navigateTo(
                context,
                ProductDetailsScreen(
                  product: product,
                ));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CachedNetworkImage(
                      height: 26.h,
                      width: 43.w,
                      imageUrl: product.img!,
                      fit: BoxFit.fill,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: InkWell(
                        onTap: () {
                          mainCubit.updateCart(product: product, quantity: 1);
                        },
                        child: Container(
                          padding: EdgeInsets.all(4.sp),
                          decoration: BoxDecoration(
                            color: const Color(0xFFb8b8b8),
                            borderRadius: BorderRadius.circular(7.sp),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3.sp,
                                color: Colors.black12,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            Constants.shoppingBag,
                            width: 20.sp,
                            height: 20.sp,
                            // Icon Color
                            color: inCart ? AppColors.appPrimary : null,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SmallText(
                text: product.name!,
                spacing: 0,
                size: 12.sp,
                height: 0,
                weight: FontWeight.w500,
                color: const Color(0xFF606060),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 1.5.h,
              ),
              SmallText(
                text: "\$ ${product.price}.00",
                size: 12.sp,
                color: AppColors.appBlack,
                weight: FontWeight.w700,
                spacing: 0,
              )
            ],
          ),
        );
      },
    );
  }
}
