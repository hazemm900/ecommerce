import 'package:ecommerce/core/base_widget/custom_elevated_button.dart';
import 'package:ecommerce/core/base_widget/custom_text_form_field.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_state.dart';
import 'package:ecommerce/features/auth/widgets/forget_password_spacer_widget.dart';
import 'package:ecommerce/features/auth/widgets/social_media_row_widget.dart';
import 'package:ecommerce/features/auth/widgets/text_divider_widget.dart';
import 'package:ecommerce/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                      label: "Full Name",
                      hintText: "Enter your name",
                      textEditingController: cubit.nameController),
                  verticalSpace(26),
                  TextFormFieldWidget(
                      label: "Phone number",
                      hintText: "xxx xxx xxxx",
                      textInputType: TextInputType.phone,
                      textEditingController: cubit.phoneController),
                  verticalSpace(26),
                  TextFormFieldWidget(
                      label: "Email address",
                      hintText: "Enter your email",
                      textEditingController: cubit.emailController),
                  verticalSpace(26),
                  TextFormFieldWidget(
                      label: "Create password",
                      hintText: "Enter your password",
                      isPasswordField: true,
                      textEditingController: cubit.passwordController),
                  verticalSpace(16),
                  const ForgetPasswordSpacerWidget(),
                  verticalSpace(38),
                  const TextDividerWidget(),
                  verticalSpace(28),
                  const SocialMediaRowWidget(),
                  verticalSpace(100),
                  CustomElevatedButton(
                      label: "Sign up",
                      onPress: () {
                        cubit.register(context);
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
