import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../cubit/main_cubit/main_states.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state) {},
      builder:(context,state){
        var mainCubit =MainCubit.get(context);
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
            )
          ),
          body: Center(
            child: BigText(text: 'Favorites'),
          ),
        );
      },
    );
  }
}
