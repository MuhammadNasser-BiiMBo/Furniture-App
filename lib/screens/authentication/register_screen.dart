import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/constants/constants.dart';
import 'package:furnitured/cubit/register_cubit/register_cubit.dart';
import 'package:furnitured/cubit/register_cubit/register_states.dart';
import 'package:furnitured/screens/authentication/login_screen.dart';
import 'package:furnitured/screens/layout/layout.dart';
import 'package:furnitured/widgets/app_button.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/default_form_field.dart';
import 'package:furnitured/widgets/default_text_button.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var registerCubit = RegisterCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 7.w,
                vertical: 5.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // styling
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: AppColors.appGrey,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        const Image(
                          width: 65,
                          height: 65,
                          image: Svg(Constants.chair),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: AppColors.appGrey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    // welcome text
                    BigText(
                      text: 'WELCOME',
                      color: AppColors.appBlack,
                      size: 18.sp,
                      family: 'Gelasio',
                      weight: FontWeight.w600,
                      spacing: 1.2,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    // Form Container
                    Container(
                      margin: EdgeInsets.only(bottom: 8.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.sp),
                        boxShadow: const [
                          BoxShadow(
                              color: AppColors.shadowColor,
                              blurRadius: 5,
                              offset: Offset(3, 3),
                              spreadRadius: 1),
                        ],
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            // name
                            DefaultFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              label: 'Name',
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'please enter your Name';
                                }
                              },
                            ),
                            SizedBox(

                              height: 3.h,
                            ),
                            // email
                            DefaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              label: 'Email',
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'please enter your email address';
                                }
                              },
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            // password
                            DefaultFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              label: 'Password',
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'please enter your password';
                                }
                              },
                              suffix: registerCubit.suffix,
                              isPassword: registerCubit.isPassword,
                              suffixPressed: () {
                                registerCubit.changePasswordVisibility();
                              },
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            // phone
                            DefaultFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              label: 'Phone',
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'please enter your phone number';
                                }
                              },
                            ),
                            SizedBox(
                              height: 6.h,
                            ),
                            // Register button
                            AppButton(
                              text: 'SIGN UP',
                              buttonHeight: 6.h,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  registerCubit.register(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                    phone: phoneController.text,
                                  ).then((value) {
                                    navigateTo(context, const AppLayout());
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            // go to sign in
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallText(
                                  text: 'Already have an account?',
                                  spacing: 0,
                                  weight: FontWeight.w600,
                                  size: 11.sp,
                                ),
                                DefaultTextButton(
                                  text: 'SIGN IN',
                                  onPressed: () {
                                    navigateTo(
                                      context,
                                      LoginScreen(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
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
