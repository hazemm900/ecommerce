import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextSpan extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final VoidCallback onPress;

  const CustomTextSpan(
      {super.key,
      required this.firstLabel,
      required this.secondLabel,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPress,
        child: RichText(
          text: TextSpan(
            text: firstLabel,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade500),
            children: <TextSpan>[
              TextSpan(
                text: secondLabel,
                style: const TextStyle(
                    color: MyColors.myMutedGold,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
