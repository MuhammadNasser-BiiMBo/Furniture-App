import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/constants/constants.dart';
import 'package:furnitured/screens/product/product_details_screen.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

import '../models/product_model.dart';

class Product extends StatelessWidget {
  final ProductModel product;
  const Product({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        navigateTo(context,  ProductDetailsScreen(product: product,));
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
                  imageUrl: product.img!,fit:BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: InkWell(
                    onTap: (){
                      print('added to cart');
                    },
                    child: Container(
                      padding: EdgeInsets.all(4.sp),
                      decoration: BoxDecoration(
                        color: const Color(0xFFb6b6b6),
                        borderRadius: BorderRadius.circular(7.sp)
                      ),
                      child: Image.asset(Constants.shoppingBag,width:20.sp,height: 20.sp, ),
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
            color: const Color(0xFF606060),overflow: TextOverflow.ellipsis,
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
  }
}
