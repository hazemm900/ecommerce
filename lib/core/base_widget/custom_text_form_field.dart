import 'package:ecommerce/core/base_widget/logic/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:ecommerce/core/base_widget/logic/obscure_text_cubit/obscure_text_state.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onPressSuffix;
  final TextInputType? keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool isEnabled;
  final TextStyle? textStyle;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressSuffix,
    this.keyboardType = TextInputType.emailAddress,
    this.isPassword = false,
    this.validator,
    this.isEnabled = true,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return isPassword
        ? BlocBuilder<ObscureTextCubit, ObscureTextState>(
            builder: (context, state) {
              var cubit = BlocProvider.of<ObscureTextCubit>(context);
              return _buildTextField(
                context,
                obscureText: cubit.obscureText,
                suffixIcon: IconButton(
                  onPressed: cubit.togglePasswordIcon,
                  icon: cubit.suffixIcon,
                  color: MyColors.myLightGrey,
                ),
              );
            },
          )
        : _buildTextField(context, suffixIcon: suffixIcon);
  }

  Widget _buildTextField(BuildContext context,
      {bool obscureText = false, Widget? suffixIcon}) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      cursorColor: MyColors.myLightGrey,
      style: textStyle ?? const TextStyle(color: Colors.black),
      validator: validator,
      enabled: isEnabled,
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.myLightGreyForTextForm,
        hintText: hintText,
        hintStyle: const TextStyle(color: MyColors.myLightGrey),
        prefixIcon: prefixIcon,
        prefixIconColor: MyColors.myLightGrey,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r),
          borderSide: const BorderSide(color: Colors.black),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 20.w,
        ),
      ),
    );
  }
}
