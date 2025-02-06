import 'package:ecommerce/core/base_widget/logic/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:ecommerce/core/base_widget/logic/obscure_text_cubit/obscure_text_state.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class CustomTextFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onPressSuffix;
  final TextInputType? textInputType;
  final bool isPasswordField;

  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType = TextInputType.emailAddress,
    this.isPasswordField = false,
    this.onPressSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return isPasswordField
        ? BlocProvider(
      create: (context) => ObscureTextCubit(),
      child: BlocBuilder<ObscureTextCubit, ObscureTextState>(
        builder: (context, state) {
          var cubit = ObscureTextCubit.get(context);
          return TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            obscureText: cubit.obscureText,
            cursorColor: Colors.grey,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              fillColor: MyColors.myLightGreyForTextForm, // Light grey background
              hintText: hintText,
              hintStyle: const TextStyle(color: MyColors.myLightGrey),
              prefixIcon: prefixIcon,
              prefixIconColor: MyColors.myLightGrey,
              suffixIcon: IconButton(
                onPressed: () {
                  cubit.togglePasswordIcon();
                },
                icon: cubit.suffixIcon,
                color: MyColors.myLightGrey,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r), // Rounded corners
                borderSide: BorderSide.none, // Remove border
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.r), // Rounded corners
                borderSide: const BorderSide(color: Colors.black), // Black border on focus
              ),
              contentPadding:  EdgeInsets.symmetric(
                vertical: 16.h, // Adjust padding
                horizontal: 20.w,
              ),
            ),
          );
        },
      ),
    )
        : TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      cursorColor: MyColors.myLightGrey,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: MyColors.myLightGreyForTextForm, // Light grey background
        hintText: hintText,
        hintStyle: const TextStyle(color: MyColors.myLightGrey),
        prefixIcon: prefixIcon,
        prefixIconColor: MyColors.myLightGrey,
        suffixIcon: suffixIcon != null
            ? IconButton(onPressed: onPressSuffix, icon: suffixIcon!)
            : null,
        suffixIconColor: MyColors.myLightGrey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r), // Rounded corners
          borderSide: BorderSide.none, // Remove border
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.r), // Rounded corners
          borderSide: const BorderSide(color: Colors.black), // Black border on focus
        ),
        contentPadding:  EdgeInsets.symmetric(
          vertical: 16.h, // Adjust padding
          horizontal: 20.w,
        ),
      ),
    );
  }
}
