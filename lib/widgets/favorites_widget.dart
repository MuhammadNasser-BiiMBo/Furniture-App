import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/models/product_model.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class FavWidget extends StatelessWidget {
  final ProductModel product;
  const FavWidget({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16.h,
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            height: 12.h,
            width: 25.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.sp),
            ),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
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
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                child: Icon(
                  Icons.highlight_remove_outlined,
                  size: 18.sp,
                ),
                onTap: () {},
              ),
              InkWell(
                onTap: (){
                  print('added to cart');
                },
                child: Container(
                  padding: EdgeInsets.all(4.sp),
                  decoration: BoxDecoration(
                      color: AppColors.appFormFieldBorder,
                      borderRadius: BorderRadius.circular(7.sp)
                  ),
                  child: Image.asset(Constants.shoppingBag,width:16.sp,height: 16.sp,color: AppColors.appPrimary, ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
