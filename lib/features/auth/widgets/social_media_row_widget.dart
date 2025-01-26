import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class SocialMediaRowWidget extends StatelessWidget {
  const SocialMediaRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 71,
          width: 71,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: MyColors.myLightGrey)),
          child: Image.asset("assets/images/Google.png"),
        ),
        horizontalSpace(20),
        Container(
          height: 71,
          width: 71,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(color: MyColors.myLightGrey)),
          child: Image.asset("assets/images/Apple.png"),
        ),
        horizontalSpace(20),
        Container(
          height: 71,
          width: 71,
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
