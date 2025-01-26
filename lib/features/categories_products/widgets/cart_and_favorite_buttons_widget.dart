import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_cubit.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartAndFavoritesButtonsWidget extends StatelessWidget {
  const CartAndFavoritesButtonsWidget(
      {super.key,
      required this.productId,
      required this.buttonColor,
      required this.buttonLabel,
      required this.buttonIcon});

  final int productId;
  final Color buttonColor;
  final IconData buttonIcon;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      bloc: getIt<CartsCubit>(),
      builder: (context, state) {
        return ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {
              getIt<CartsCubit>().addOrRemoveCartItem(context, productId);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  buttonLabel,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                horizontalSpace(8),
                Icon(buttonIcon,color: Colors.white,)
              ],
            ));
      },
    );
  }
}
