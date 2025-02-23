import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/base_widget/custom_material_button.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_cubit.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_state.dart';
import 'package:ecommerce/features/address/screens/update_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllAddressesScreen extends StatelessWidget {
  const AllAddressesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      bloc: AddressCubit(getIt())..getAllAddresses(),
      builder: (context, state) {
        var cubit = getIt<AddressCubit>();
        final addresses = cubit.getAddressModel?.data?.getAllAddresses ?? [];

        return Scaffold(
          appBar: const CustomAppBar(
            title: "All Addresses",
          ),
          body: state is AddressLoadingState
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Addresses Details",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        verticalSpace(16.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: addresses.length,
                          itemBuilder: (context, index) {
                            final address = addresses[index];
                            return ListTile(
                              leading: const Icon(
                                Icons.location_on_outlined,
                                color: MyColors.myMutedGold,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateAddressScreen(
                                                      addressId:
                                                          addresses[index].id ??
                                                              0,
                                                    )));
                                      },
                                      icon: const Icon(
                                        Icons.edit_outlined,
                                        color: Colors.green,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        cubit.deleteAddress(
                                            context, addresses[index].id ?? 0);
                                      },
                                      icon: const Icon(
                                        Icons.delete_outline,
                                        color: Colors.red,
                                      )),
                                ],
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Location name: ${address.name ?? "No name"}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 12.sp),
                                  ),
                                  verticalSpace(8),
                                  Text(
                                    "City name: ${address.city ?? "No city"}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 12.sp),
                                  ),
                                  Text(
                                      "Details:${address.details ?? "No details"}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(fontSize: 12.sp)),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              color: MyColors.myMutedGold,
                            );
                          },
                        ),
                        verticalSpace(100.h),
                        CustomMaterialButton(
                            label: "Add New Address",
                            onPress: () {
                              Navigator.of(context, rootNavigator: true)
                                  .pushNamed(Routes.addAddressScreen);
                            })
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
