import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/cubit/main_cubit/main_states.dart';
import 'package:furnitured/widgets/app_button.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/back_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/default_form_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainStates>(
      listener: (context, state) {
        if(state is ChangePasswordSuccessState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var mainCubit = MainCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Back(),
                BigText(
                  text: 'Change Password',
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(
                      text:
                          'Note: Your Password must contain at least 8 digits (a Special character, a Capital character, and a small character).',
                      spacing: 0,
                      weight: FontWeight.w700,
                      color: AppColors.appPrimary,
                      height: 0,
                      size: 12.sp,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      label: 'Email Address',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Email can\'t be empty !';
                        }
                      },
                      hasShadow: true,
                      isSetting: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      label: 'Password',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Password can\'t be empty !';
                        }
                      },
                      hasShadow: true,
                      isSetting: true,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: newPasswordController,
                      type: TextInputType.visiblePassword,
                      label: 'New Password',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Password can\'t be empty !';
                        }
                      },
                      hasShadow: true,
                      isSetting: true,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: confirmController,
                      type: TextInputType.visiblePassword,
                      label: 'Confirm Password',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Confirm Password can\'t be empty !';
                        }
                      },
                      hasShadow: true,
                      isSetting: true,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 7.h,
                    ),
                    AppButton(
                      text: 'Submit',
                      radius: 5.sp,
                      buttonWidth: 90.w,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          mainCubit.changePassword(
                            email: emailController.text,
                            password: passwordController.text,
                            newPassword: newPasswordController.text,
                            confirmPass: confirmController.text,
                          );
                        }
                      },
                      buttonHeight: 7.h,
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
