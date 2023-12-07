import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/cubit/main_cubit/main_states.dart';
import 'package:furnitured/screens/settings/change_password_screen.dart';
import 'package:furnitured/widgets/default_form_field.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/back_icon.dart';
import '../../widgets/big_text.dart';
import '../shipping_address/shipping_address_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = MainCubit.get(context).user!.name!;
    emailController.text = MainCubit.get(context).user!.email!;
    phoneController.text = MainCubit.get(context).user!.phone!;
    passwordController.text = '00000000000000';
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        var user = MainCubit.get(context).user;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Back(),
                BigText(
                  text: 'Settings',
                  weight: FontWeight.w700,
                  size: 16.sp,
                  spacing: 0,
                  color: AppColors.appPrimary,
                ),
                SizedBox(
                  width: 30.sp,
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.w,
                vertical: 2.h,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //personal info
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: 'Personal Information',
                          spacing: 0,
                          color: AppColors.appGrey,
                          weight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              if (!(user!.phone == phoneController.text &&
                                  user.email == emailController.text &&
                                  user.name == nameController.text)) {
                                mainCubit.updateUserData(
                                  emailController.text,
                                  nameController.text,
                                  phoneController.text,
                                );
                              }
                            }
                          },
                          child: SvgPicture.asset(
                            'assets/icons/edit.svg',width:20.sp
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      label: 'Name',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Name can\'t be empty !';
                        }
                      },
                      hasShadow: true,
                      isSetting: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Email Address can\'t be empty !';
                        }
                      },
                      hasShadow: true,
                      isSetting: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: phoneController,
                      type: TextInputType.phone,
                      label: 'Phone',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Phone Number can\'t be empty !';
                        }
                      },
                      hasShadow: true,
                      isSetting: true,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: 'Password',
                          spacing: 0,
                          color: AppColors.appGrey,
                          weight: FontWeight.w600,
                        ),
                        InkWell(
                          onTap: () {
                            navigateTo(context, ChangePasswordScreen());
                          },
                          child: SvgPicture.asset(
                            'assets/icons/edit.svg',
                                width: 24.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: passwordController,
                      type: TextInputType.phone,
                      label: 'Password',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Password can\'t be empty !';
                        }
                      },
                      hasShadow: true,
                      isSetting: true,
                      isPassword: true,
                      isClickable: false,
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // notifications
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BigText(
                          text: 'Notifications',
                          spacing: 0,
                          color: AppColors.appGrey,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 1.8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.sp),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 8.sp,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: 'Sales',
                            spacing: 0,
                            size: 14.sp,
                            weight: FontWeight.w600,
                          ),
                          FlutterSwitch(
                            value: user!.notificationSettings!.sales!,
                            onToggle: mainCubit.changeNotificationSales,
                            activeColor: Colors.green.shade600,
                            width: 13.w,
                            height: 3.5.h,
                            toggleSize: 19.sp,
                            padding: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 1.8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.sp),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 8.sp,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: 'New Arrivals',
                            spacing: 0,
                            size: 14.sp,
                            weight: FontWeight.w600,
                          ),
                          FlutterSwitch(
                            value: user.notificationSettings!.newArrivals!,
                            onToggle: mainCubit.changeNotificationArrivals,
                            activeColor: Colors.green.shade600,
                            width: 13.w,
                            height: 3.5.h,
                            toggleSize: 19.sp,
                            padding: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 1.8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.sp),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadowColor,
                            blurRadius: 8.sp,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BigText(
                            text: 'Delivery status changes',
                            spacing: 0,
                            size: 14.sp,
                            weight: FontWeight.w600,
                          ),
                          FlutterSwitch(
                            value: false,
                            onToggle: (value) {},
                            disabled: true,
                            activeColor: Colors.green.shade600,
                            width: 13.w,
                            height: 3.5.h,
                            toggleSize: 19.sp,
                            padding: 2,
                          ),
                        ],
                      ),
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
