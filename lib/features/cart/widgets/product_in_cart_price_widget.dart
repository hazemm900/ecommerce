import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_cubit.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductInCartPriceWidget extends StatelessWidget {
  const ProductInCartPriceWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      bloc: getIt<CartsCubit>(),
      builder: (context, state) {
        var cubit = getIt<CartsCubit>();
        return Row(
          children: [
            Text(
              "Total: ",
              style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium,
            ),
            const Spacer(),
            Text(
              cubit.getCartModel?.data?.cartItems?[index]
                  .product?.price
                  .toString() ??
                  "",
              style: Theme
                  .of(context)
                  .textTheme
                  .displayMedium,
            ),
          ],
        );
      },
    );
  }
}
