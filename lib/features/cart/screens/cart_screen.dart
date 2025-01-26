import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/address/logic/address_cubit/address_cubit.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_cubit.dart';
import 'package:ecommerce/features/cart/widgets/address_details_widget.dart';
import 'package:ecommerce/features/cart/widgets/cart_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "My Cart",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddressDetailsWidget(),
            CartListWidget(),
          ],
        ),
      ),
    );
  }
}
