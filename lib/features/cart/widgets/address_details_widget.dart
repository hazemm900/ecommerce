import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_cubit.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddressDetailsWidget extends StatelessWidget {
  const AddressDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressCubit, AddressState>(
      bloc: getIt<AddressCubit>()..getAllAddresses(),
        builder: (context, state) {
          var cubit = getIt<AddressCubit>();
          return Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: MyColors.myMutedGold,
                    ),
                    horizontalSpace(4),
                    Text(
                      'Delivery Address',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                verticalSpace(10),
                Row(
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              verticalSpace(10),
                              state is AddressLoadingState
                                  ? const SpinKitHourGlass(
                      color: MyColors.myMutedGold,
                      size: 50.0,
                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Address: ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        verticalSpace(4),
                                        Text(
                                          cubit.getAddressModel?.data?.getAllAddresses?[0].details ?? "no address set ",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context).textTheme.bodySmall,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit_note_outlined,
                              color: MyColors.myMutedGold,
                            )),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      );
  }
}
