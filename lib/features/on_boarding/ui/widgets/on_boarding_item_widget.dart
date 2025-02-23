import 'package:ecommerce/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingItemWidget extends StatelessWidget {
  final String title;
  final String imageAsset;

  const OnboardingItemWidget(
      {super.key, required this.title, required this.imageAsset});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              imageAsset,
              height: 300.h,
              width: 400.w,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            verticalSpace(10.h),
            Text(
              "test on boarding",
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
