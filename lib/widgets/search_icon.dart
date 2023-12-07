import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitured/constants/colors.dart';
import 'package:sizer/sizer.dart';

import '../constants/constants.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: SvgPicture.asset(
          color: AppColors.appPrimary,
          Constants.search,
        ),
      ),
    );
  }
}
