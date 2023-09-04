import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/constants/constants.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/cubit/main_cubit/main_states.dart';
import 'package:furnitured/widgets/app_button.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/expandable_text_widget.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

import '../../models/product_model.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;
  ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedColor = 0;
  int quantity = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder:(context,state) {
        var mainCubit = MainCubit.get(context);
        var inFavorites = mainCubit.inFavorites.contains(widget.product.id);
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: 56.5.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.sp),
                        ),
                      ),
                      margin: EdgeInsets.only(left: 15.w),
                      child: CachedNetworkImage(
                        imageUrl: widget.product.img!,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 9.w,
                      top: 6.5.h,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(7.sp),
                          height: 5.h,
                          width: 11.w,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.sp),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                offset: Offset(1, 1),
                                blurRadius: 3,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            Constants.backButton,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 7.w,
                      top: 18.h,
                      child: Container(
                        // padding:
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.shadowColor,
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            3,
                                (index) => GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.all(10.sp),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: selectedColor == index
                                        ? Colors.white
                                        : productColor[index],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: selectedColor == index
                                          ? productColor[index]
                                          : AppColors.appBlurGrey,
                                      width: 5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 2.7.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: widget.product.name!,
                        family: 'Gelasio',
                        weight: FontWeight.w500,
                        spacing: 0,
                        size: 20.sp,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: "\$ ${widget.product.price}.00",
                            size: 24.sp,
                            weight: FontWeight.w700,
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (quantity > 0) {
                                    setState(() {
                                      quantity -= 1;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.sp),
                                    color: AppColors.appBlurGrey,
                                  ),
                                  width: 24.sp,
                                  height: 24.sp,
                                  padding: EdgeInsets.all(2.sp),
                                  child:
                                  const Image(image: Svg(Constants.decrease)),
                                ),
                              ),
                              SizedBox(width: 5.w),
                              BigText(
                                text: '$quantity',
                                weight: FontWeight.w600,
                                size: 16.sp,
                                spacing: 0,
                              ),
                              SizedBox(width: 5.w),
                              InkWell(
                                onTap: () {
                                  if (quantity < 10) {
                                    setState(() {
                                      quantity += 1;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3.sp),
                                    color: AppColors.appBlurGrey,
                                  ),
                                  width: 24.sp,
                                  height: 24.sp,
                                  padding: EdgeInsets.all(2.sp),
                                  child:
                                  const Image(image: Svg(Constants.increase)),
                                ),
                              ),
                              SizedBox(width: 4.w),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        children: [
                          const Image(
                            color: AppColors.appYellow,
                            image: Svg(Constants.star),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          BigText(
                            text: widget.product.rate.toString(),
                            weight: FontWeight.w700,
                            spacing: 0,
                            size: 16.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          SmallText(
                            text: '(${widget.product.reviews} reviews)',
                            spacing: 0,
                            weight: FontWeight.w600,
                            size: 11.sp,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ExpandableTextWidget(
                        text: widget.product.desc!,
                        lineHeight: 0,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(bottom: 4.h, left: 6.w, right: 6.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      mainCubit.updateFav(widget.product);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: inFavorites ? AppColors.appPrimary : AppColors.appCat,

                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.sp),
                        child: Image(
                          color: inFavorites ? Colors.white : AppColors.appPrimary,
                          image: const Svg(
                            Constants.fav,
                          ),
                        ),
                      ),
                    ),
                  ),
                  AppButton(
                    text: 'Add to cart',
                    onPressed: () {},
                    buttonHeight: 42.sp,
                    buttonWidth: 68.w,
                  ),
                ],
              ),
            ),
          ),
        );
      } ,
    );
  }
}
