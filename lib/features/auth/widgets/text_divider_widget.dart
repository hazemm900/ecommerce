import 'package:ecommerce/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextDividerWidget extends StatelessWidget {
  const TextDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Or Login using:",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        horizontalSpace(16.w),
        const Expanded(
          child: Divider(
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
