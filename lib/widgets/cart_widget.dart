import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/cubit/main_cubit/main_states.dart';
import 'package:furnitured/models/cart_model.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class CartWidget extends StatelessWidget {
  final CartModel product;
  const CartWidget({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder: (context,state){
        var mainCubit = MainCubit.get(context);
        return Container(
          height: 18.h,
          padding: EdgeInsets.symmetric(vertical: 2.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 14.h,
                width: 25.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl:product.img!,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: product.name!,
                    spacing: 0,
                    weight: FontWeight.w600,
                    color: const Color(0xFF606060),
                    overflow: TextOverflow.ellipsis,size: 11.sp,height: 0,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  BigText(
                    text: '\$ ${product.price}.00',
                    spacing: 0,
                    weight: FontWeight.w700,
                    size: 14.sp,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          if (product.quantity! > 1) {
                            mainCubit.updateCartItemQuantity(product: product, quantity: product.quantity!-1);
                          }else if(product.quantity! == 1){
                            mainCubit.updateCart(product: product);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.sp),
                            color: AppColors.appBlurGrey,
                          ),
                          width: 24.sp,
                          height: 24.sp,
                          padding: EdgeInsets.all(2.sp),
                          child:
                          SvgPicture.asset(Constants.decrease),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      BigText(
                        text: product.quantity.toString(),
                        weight: FontWeight.w600,
                        size: 16.sp,
                        spacing: 0,
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        onTap: () {
                          if (product.quantity! < 10) {
                            mainCubit.updateCartItemQuantity(product: product, quantity: product.quantity!+1);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.sp),
                            color: AppColors.appBlurGrey,
                          ),
                          width: 24.sp,
                          height: 24.sp,
                          padding: EdgeInsets.all(2.sp),
                          child:
                          SvgPicture.asset(Constants.increase),
                        ),
                      ),
                      SizedBox(width: 4.w),
                    ],
                  ),

                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.highlight_remove_outlined,
                      size: 18.sp,
                    ),
                    onTap: () {
                      mainCubit.updateCart( product: product,quantity: 1);
                    },
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
