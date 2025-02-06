import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_cubit.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              minimumSize: Size(double.infinity, 50.w),
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r),
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
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
                horizontalSpace(8.w),
                Icon(
                  buttonIcon,
                  color: Colors.white,
                )
              ],
            ));
      },
    );
  }
}
