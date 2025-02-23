import 'package:ecommerce/core/base_widget/custom_text_form_field.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController textEditingController;
  final TextInputType textInputType; // New property for keyboard type
  final bool isPasswordField; // New property to check if it's a password field

  const TextFormFieldWidget({
    super.key,
    required this.label,
    required this.hintText,
    required this.textEditingController,
    this.textInputType = TextInputType.text, // Default is regular text
    this.isPasswordField = false, // Default is not a password field
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        verticalSpace(6.h),
        CustomTextFormField(
          controller: textEditingController,
          hintText: hintText,
          keyboardType: textInputType, // Pass the keyboard type
          isPassword: isPasswordField, // Pass the password field flag
        ),
      ],
    );
  }
}
