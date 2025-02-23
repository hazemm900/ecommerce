import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextSpan extends StatelessWidget {
  final String firstLabel;
  final String secondLabel;
  final VoidCallback onPress;
  final TextStyle? firstLabelStyle;
  final TextStyle? secondLabelStyle;

  const CustomTextSpan({
    super.key,
    required this.firstLabel,
    required this.secondLabel,
    required this.onPress,
    this.firstLabelStyle,
    this.secondLabelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onPress,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: firstLabel,
            style: firstLabelStyle ??
                TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade500,
                ),
            children: <TextSpan>[
              TextSpan(
                text: secondLabel,
                style: secondLabelStyle ??
                    TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: MyColors.myMutedGold,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
