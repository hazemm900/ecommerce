import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialMediaRowWidget extends StatelessWidget {
  const SocialMediaRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 71.h,
          width: 71.w,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: MyColors.myLightGrey)),
          child: Image.asset("assets/images/Google.png"),
        ),
        horizontalSpace(20.w),
        Container(
          height: 71.h,
          width: 71.w,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: MyColors.myLightGrey)),
          child: Image.asset("assets/images/Apple.png"),
        ),
        horizontalSpace(20.w),
        Container(
          height: 71.h,
          width: 71.w,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: MyColors.myLightGrey)),
          child: Image.asset("assets/images/Facebook.png"),
        ),
      ],
    );
  }
}
