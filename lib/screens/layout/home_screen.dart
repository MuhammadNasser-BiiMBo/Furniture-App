import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/cubit/home_cubit/home_cubit.dart';
import 'package:furnitured/cubit/home_cubit/home_states.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/cart_icon.dart';
import 'package:furnitured/widgets/product.dart';
import 'package:furnitured/widgets/search_icon.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var homeCubit = HomeCubit.get(context);
        homeCubit.getCategories();
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SearchButton(),
                  BigText(
                    text: 'Furnitured',
                    weight: FontWeight.w600,
                    size: 16.sp,
                    spacing: 0,
                    color: AppColors.appPrimary,
                  ),
                  const CartButton(),
                ],
              ),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 3.h,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // categories
                    SizedBox(
                      height: 10.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            homeCubit.changeCategory(index);
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 40.sp,
                                height: 40.sp,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  color: homeCubit.selectedCategory == index
                                      ? AppColors.appBlack
                                      : AppColors.appCat,
                                ),
                                child: Center(
                                  child: SvgPicture.asset(
                                    width: index == 5 ? 30.sp : null,
                                    color: homeCubit.selectedCategory == index
                                        ? Colors.white
                                        : AppColors.appPrimary,
                                    categoryImages[index],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              SmallText(
                                text: categoryLabels[index],
                                color: homeCubit.selectedCategory == index
                                    ? AppColors.appPrimary
                                    : AppColors.appGrey,
                                size: 12.sp,
                                weight: FontWeight.w500,
                                spacing: 0,
                              )
                            ],
                          ),
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 5.w),
                        itemCount: categoryLabels.length,
                      ),
                    ),
                    // spacing
                    SizedBox(
                      height: 2.h,
                    ),
                    // products
                    ConditionalBuilder(
                      condition: homeCubit.allProducts.isNotEmpty &&
                          MainCubit.get(context).user?.uId != null,
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.appPrimary,
                        ),
                      ),
                      builder: (context) {
                        MainCubit.get(context).getCart();
                        MainCubit.get(context).inFav();
                        MainCubit.get(context).inCart();
                        return GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisSpacing: 5.w,
                          mainAxisSpacing: 2.h,
                          childAspectRatio: 1 / 1.8,
                          scrollDirection: Axis.vertical,
                          children: List.generate(
                            homeCubit
                                .getCategories()[homeCubit.selectedCategory]
                                .length,
                            (index) => Product(
                                product: homeCubit.getCategories()[
                                    homeCubit.selectedCategory][index]),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
