import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/features/cart/widgets/address_details_widget.dart';
import 'package:ecommerce/features/cart/widgets/cart_list_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "My Cart",
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
