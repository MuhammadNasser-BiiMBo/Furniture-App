import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../cubit/main_cubit/main_states.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

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
                    child: SvgPicture.asset( Constants.search),
                  ),
                ),
                BigText(
                  text: 'Notification',
                  weight: FontWeight.w600,
                  size: 16.sp,
                  spacing: 0,
                  color: AppColors.appPrimary,
                ),
                SizedBox(width: 30.sp,),
              ],
            ),
          ),
          body: Center(
            child: BigText(text: 'Notifications'),
          ),
        );
      },
    );
  }
}
