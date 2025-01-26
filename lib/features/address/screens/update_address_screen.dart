import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/base_widget/custom_elevated_button.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_cubit.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_state.dart';
import 'package:ecommerce/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateAddressScreen extends StatelessWidget {
  const UpdateAddressScreen({super.key, required this.addressId});
  final int addressId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      bloc: getIt<AddressCubit>(),
      builder: (context, state) {
        var cubit = getIt<AddressCubit>();
        return Scaffold(
          appBar: const CustomAppBar(appBarTitle: "Update Address"),
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
                  verticalSpace(26),
                  TextFormFieldWidget(
                      label: "City name",
                      hintText: "Enter your city name",
                      textEditingController: cubit.cityController),
                  verticalSpace(26),
                  TextFormFieldWidget(
                      label: "Region name",
                      hintText: "Enter your region name",
                      textEditingController: cubit.regionController),
                  verticalSpace(26),
                  TextFormFieldWidget(
                      label: "Details",
                      hintText: "Enter location details",
                      textEditingController: cubit.detailsController),
                  verticalSpace(26),
                  TextFormFieldWidget(
                      label: "Notes",
                      hintText: "Notes...",
                      textEditingController: cubit.notesController),
                  verticalSpace(100),
                  CustomElevatedButton(
                      label: "Update Address",
                      onPress: () {
                        cubit.updateAddress(
                            context, addressId);
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
