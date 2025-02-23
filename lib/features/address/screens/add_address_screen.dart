import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/base_widget/custom_material_button.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_cubit.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_state.dart';
import 'package:ecommerce/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      bloc: getIt<AddressCubit>(),
      builder: (context, state) {
        var cubit = getIt<AddressCubit>();
        return Scaffold(
          appBar: const CustomAppBar(title: "Add Address"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormFieldWidget(
                      label: "Location name",
                      hintText: "Enter your location name",
                      textEditingController: cubit.nameController),
                  verticalSpace(26.h),
                  TextFormFieldWidget(
                      label: "City name",
                      hintText: "Enter your city name",
                      textEditingController: cubit.cityController),
                  verticalSpace(26.h),
                  TextFormFieldWidget(
                      label: "Region name",
                      hintText: "Enter your region name",
                      textEditingController: cubit.regionController),
                  verticalSpace(26.h),
                  TextFormFieldWidget(
                      label: "Details",
                      hintText: "Enter location details",
                      textEditingController: cubit.detailsController),
                  verticalSpace(26.h),
                  TextFormFieldWidget(
                      label: "Notes",
                      hintText: "Notes...",
                      textEditingController: cubit.notesController),
                  verticalSpace(100.h),
                  CustomMaterialButton(
                      label: "Add Address",
                      onPress: () {
                        cubit.setNewAddress(context);
                      }),
                  verticalSpace(26.h),
                  CustomMaterialButton(
                      label: "Get All Address",
                      onPress: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(Routes.allAddressesScreen);
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
