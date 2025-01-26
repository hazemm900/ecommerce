import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_cubit.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_state.dart';
import 'package:ecommerce/features/auth/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressDetailsWidget extends StatelessWidget {
  const AddressDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      bloc: getIt<AddressCubit>()..getAllAddresses(),
      builder: (context, state) {
        var cubit = getIt<AddressCubit>();
        final addresses = cubit.getAddressModel?.data?.getAllAddresses ?? [];
        cubit.nameController.text = addresses[0].name ?? "no name";
        cubit.cityController.text = addresses[0].city ?? "no city";
        cubit.regionController.text = addresses[0].region ?? "no region";
        cubit.detailsController.text = addresses[0].details ?? "no details";
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Business Address Details",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            verticalSpace(20),
            addresses.isEmpty == true
                ? const Center(child: Text("no addresses added!!!"))
                : Column(
                    children: [
                      TextFormFieldWidget(
                          label: "address name",
                          hintText: "name...",
                          textEditingController: cubit.nameController),
                      verticalSpace(28),
                      TextFormFieldWidget(
                          label: "city",
                          hintText: "city...",
                          textEditingController: cubit.cityController),
                      verticalSpace(28),
                      TextFormFieldWidget(
                          label: "region",
                          hintText: "region...",
                          textEditingController: cubit.regionController),
                      verticalSpace(28),
                      TextFormFieldWidget(
                          label: "details",
                          hintText: "details...",
                          textEditingController: cubit.detailsController),
                    ],
                  ),
          ],
        );
      },
    );
  }
}
