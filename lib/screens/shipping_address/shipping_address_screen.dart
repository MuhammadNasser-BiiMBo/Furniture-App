import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:furnitured/cubit/main_cubit/main_cubit.dart';
import 'package:furnitured/cubit/main_cubit/main_states.dart';
import 'package:furnitured/models/address_model.dart';
import 'package:furnitured/widgets/app_button.dart';
import 'package:furnitured/widgets/default_form_field.dart';
import 'package:furnitured/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/back_icon.dart';
import '../../widgets/big_text.dart';

class ShippingAddressScreen extends StatelessWidget {
  ShippingAddressScreen({super.key});
  var fullNameController = TextEditingController();
  var addressController = TextEditingController();
  var zipCodeController = TextEditingController();
  var countryController = TextEditingController();
  var cityController = TextEditingController();
  var districtController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    fullNameController.text = MainCubit.get(context).user!.address!.fullName!;
    addressController.text = MainCubit.get(context).user!.address!.address!;
    zipCodeController.text = MainCubit.get(context).user!.address!.postalCode!;
    countryController.text = MainCubit.get(context).user!.address!.country!;
    cityController.text = MainCubit.get(context).user!.address!.city!;
    districtController.text = MainCubit.get(context).user!.address!.district!;
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context,state){},
      builder:(context,state){
        var mainCubit = MainCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Back(),
                BigText(
                  text: 'Edit shipping address',
                  weight: FontWeight.w600,
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
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h,),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: fullNameController,
                      type: TextInputType.name,
                      label: 'Full Name',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter your full name';
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: addressController,
                      type: TextInputType.text,
                      label: 'Address',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter your address';
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: zipCodeController,
                      type: TextInputType.number,
                      label: 'Zipcode (Postal Code)',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter your zip code';
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: countryController,
                      type: TextInputType.name,
                      label: 'Country',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter your country';
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: cityController,
                      type: TextInputType.name,
                      label: 'City',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter your city';
                        }
                      },
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    DefaultFormField(
                      controller: districtController,
                      type: TextInputType.name,
                      label: 'District',
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'Enter your district';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal:5.w,vertical: 4.h),
            child: AppButton(
              text: 'Save Address',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  AddressModel addressModel = AddressModel(
                    fullName: fullNameController.text,
                    address: addressController.text,
                    city: cityController.text,
                    country: countryController.text,
                    district: districtController.text,
                    postalCode: zipCodeController.text,
                  );
                  mainCubit.saveUserAddress(addressModel).then((value) {
                    Navigator.pop(context);
                  });
                }
              },
              buttonWidth: 90.w,
              buttonHeight: 8.h,
            ),
          ),

        );
      }
    );
  }
}
