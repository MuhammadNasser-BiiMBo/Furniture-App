import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/widgets/app_button.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/favorites_widget.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../cubit/main_cubit/main_states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        var favorites = mainCubit.favorites;
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: const Image(image: Svg(Constants.search)),
                    ),
                  ),
                  BigText(
                    text: 'Favorites',
                    weight: FontWeight.w500,
                    size: 18.sp,
                    spacing: 0,
                    color: AppColors.appPrimary,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: const Image(
                        image: Svg(Constants.cart),
                      ),
                    ),
                  ),
                ],
              )),
          body: ConditionalBuilder(
            condition: favorites.isNotEmpty,
            fallback: (context)=> const Center(child: Center(child: CircularProgressIndicator(color: AppColors.appPrimary,),),),
            builder:(context)=> Padding(
              padding:  EdgeInsets.symmetric(vertical: 2.h,horizontal: 5.w),
              child: Stack(
                children: [
                  ListView.separated(
                      itemBuilder: (context,index){
                        return FavWidget(product: favorites[index],);
                      },
                      separatorBuilder: (context,index){
                        return Container(height: 1,width: double.maxFinite,color: AppColors.appBlurGrey,);
                      },
                      itemCount: favorites.length,
                  ),
                  Positioned(bottom: 1.h,child: AppButton(text: 'Add all to my cart',onPressed: () {},buttonWidth: 90.w),),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
