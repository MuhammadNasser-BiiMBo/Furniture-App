import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/constants/constants.dart';
import 'package:sizer/sizer.dart';
import '../../cubit/main_cubit/main_cubit.dart';
import '../../cubit/main_cubit/main_states.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    if(Constants.uId != null){
      MainCubit.get(context).getUserData();
    }
    return BlocConsumer<MainCubit,MainStates>(
      listener:(context,state){} ,
      builder:(context,state){

        // cubit instance
        var mainCubit = MainCubit.get(context);

        return Scaffold(
          body: pages[mainCubit.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            iconSize: 18.sp,
            unselectedItemColor: AppColors.appGrey,
            selectedItemColor: AppColors.appPrimary,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            unselectedFontSize: 0,
            currentIndex: mainCubit.selectedIndex,
            enableFeedback: true,
            onTap: mainCubit.changeBottomNav,
            items: List.generate(
              4,
                  (index) => BottomNavigationBarItem(
                icon: mainCubit.selectedIndex==index?Icon(enableIcons[index]):Icon(disableIcons[index]),
                label: navLabels[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
