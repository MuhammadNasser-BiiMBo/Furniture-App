
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/cubit/main_cubit/main_states.dart';
import 'package:furnitured/screens/shipping_address/shipping_address_screen.dart';
import 'package:furnitured/widgets/profile_widget.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../widgets/big_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        var user = mainCubit.user;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 35.sp,
                ),
                BigText(
                  text: 'Profile',
                  weight: FontWeight.w600,
                  size: 16.sp,
                  spacing: 0,
                  color: AppColors.appPrimary,
                ),
                InkWell(
                  onTap: () {
                    mainCubit.logoutDialog(context);
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.sp),
                    child: const Image(
                      image: Svg(Constants.logout),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: ConditionalBuilder(
            condition: user != null,
            builder: (context) => Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 35.sp,
                        backgroundColor: Colors.grey,
                        child: user!.image!.isEmpty
                            ? Icon(
                                Icons.person,
                                size: 35.sp,
                                color: AppColors.appPrimary,
                              )
                            : Image.network(
                                user.image!,
                                fit: BoxFit.fill,
                              ),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: user.name!,
                            spacing: 0,
                            weight: FontWeight.w700,
                            size: 15.sp,
                          ),
                          SmallText(
                              text: user.email!,
                              spacing: 0,
                              weight: FontWeight.w400,
                              size: 11.sp),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  ProfileWidget(
                    title: 'My Orders',
                    text: 'Already have ${user.orders} orders',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ProfileWidget(
                    title: 'Shipping Address',
                    text: user.address==null
                        ? 'Please Add Your Location'
                        : '${user.address!.address}, ${user.address!.city}, ${user.address!.postalCode}, ${user.address!.district}, ${user.address!.country}',
                    onPressed: () {
                      navigateTo(context, ShippingAddressScreen());
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ProfileWidget(
                    title: 'My Reviews',
                    text: 'Reviews for ${user.reviews} items',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  ProfileWidget(
                    title: 'Settings',
                    text: 'Notification, Password, FAQ, Contact',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
