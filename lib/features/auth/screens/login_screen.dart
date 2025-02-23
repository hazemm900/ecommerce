import 'package:ecommerce/core/base_widget/custom_material_button.dart';
import 'package:ecommerce/core/base_widget/logic/obscure_text_cubit/obscure_text_cubit.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_state.dart';
import 'package:ecommerce/features/auth/widgets/forget_password_spacer_widget.dart';
import 'package:ecommerce/features/auth/widgets/social_media_row_widget.dart';
import 'package:ecommerce/features/auth/widgets/text_divider_widget.dart';
import 'package:ecommerce/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormFieldWidget(
                      label: "Email address",
                      hintText: "Enter your email",
                      textEditingController: cubit.emailController),
                  verticalSpace(26.h),
                  BlocProvider(
                    create: (context) => ObscureTextCubit(),
                    child: TextFormFieldWidget(
                        label: "Password",
                        hintText: "Enter your password",
                        isPasswordField: true,
                        textEditingController: cubit.passwordController),
                  ),
                  verticalSpace(16.h),
                  const ForgetPasswordSpacerWidget(),
                  verticalSpace(38.h),
                  const TextDividerWidget(),
                  verticalSpace(28.h),
                  const SocialMediaRowWidget(),
                  verticalSpace(100.h),
                  CustomMaterialButton(
                      label: "Login",
                      onPress: () {
                        cubit.logIn(context);
                      })
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
