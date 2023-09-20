import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:furnitured/constants/components.dart';
import 'package:furnitured/constants/constants.dart';
import 'package:furnitured/cubit/login_cubit/login_cubit.dart';
import 'package:furnitured/cubit/login_cubit/login_states.dart';
import 'package:furnitured/screens/authentication/register_screen.dart';
import 'package:furnitured/screens/layout/layout.dart';
import 'package:furnitured/widgets/app_button.dart';
import 'package:furnitured/widgets/big_text.dart';
import 'package:furnitured/widgets/auth_form_field.dart';
import 'package:furnitured/widgets/default_text_button.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var loginCubit = LoginCubit.get(context);
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
                    BigText(
                      text: 'Hello !',
                      color: AppColors.appGrey,
                      size: 24.sp,
                      family: 'Gelasio',
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    BigText(
                      text: 'WELCOME BACK',
                      color: AppColors.appBlack,
                      size: 18.sp,
                      family: 'Gelasio',
                      weight: FontWeight.w600,
                      spacing: 1.2,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
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
                            AuthFormField(
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
                              height: 4.h,
                            ),
                            AuthFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              label: 'Password',
                              validate: (value) {
                                if (value.isEmpty) {
                                  return 'please enter your password';
                                }
                              },
                              suffix: loginCubit.suffix,
                              isPassword: loginCubit.isPassword,
                              suffixPressed: () {
                                loginCubit.changePasswordVisibility();
                              },
                              onSubmit: (){
                                if (formKey.currentState!.validate()) {
                                  loginCubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ).then((value) {
                                    navigateTo(context,const AppLayout());
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            AppButton(
                              text: 'LOG IN',
                              buttonHeight: 6.h,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  loginCubit.userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ).then((value) {
                                    navigateTo(context,const AppLayout());
                                  });
                                }
                              },
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            DefaultTextButton(
                              text: 'SIGN UP',
                              onPressed: () {
                                navigateTo(context, RegisterScreen());
                              },
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
