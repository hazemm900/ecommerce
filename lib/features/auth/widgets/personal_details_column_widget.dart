import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_cubit.dart';
import 'package:ecommerce/features/auth/logic/auth_cubit/auth_state.dart';
import 'package:ecommerce/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalDetailsColumnWidget extends StatelessWidget {
  const PersonalDetailsColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthCubit>()..profile(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Column(
            children: [
              Text(
                "Personal Details",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              verticalSpace(20),
              TextFormFieldWidget(
                  label: "full name",
                  hintText: "full name",
                  textEditingController: cubit.nameController),
              verticalSpace(28),
              TextFormFieldWidget(
                  label: "email",
                  hintText: "email",
                  textEditingController: cubit.emailController),
              verticalSpace(28),
              TextFormFieldWidget(
                  label: "phone",
                  hintText: "000 000 0000",
                  textEditingController: cubit.phoneController),
              const Divider(
                color: MyColors.myMutedBlue,
              ),
            ],
          );
        },
      ),
    );
  }
}
