import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_cubit.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInCartDetailsWidget extends StatelessWidget {
  const ProductInCartDetailsWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      bloc: getIt<CartsCubit>(),
      builder: (context, state) {
        var cubit = getIt<CartsCubit>();
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.getCartModel?.data?.cartItems?[index].product?.name ?? "",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              verticalSpace(5.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    color: MyColors.myMutedGold,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.minimize,
                    ),
                  ),
                  horizontalSpace(4.w),
                  Text(
                    cubit.getCartModel?.data?.cartItems?[index].quantity
                            .toString() ??
                        "",
                  ),
                  horizontalSpace(4.w),
                  IconButton(
                    color: MyColors.myMutedGold,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
              verticalSpace(10.h),
              Row(
                children: [
                  Text(
                    "${cubit.getCartModel?.data?.cartItems?[index].product?.price.toString() ?? ""} EGP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.green),
                  ),
                  horizontalSpace(16.w),
                  cubit.getCartModel?.data?.cartItems?[index].product
                              ?.discount ==
                          0
                      ? const SizedBox()
                      : Flexible(
                        child: Column(
                            children: [
                              Text(
                                'up to ${cubit.getCartModel?.data?.cartItems?[index].product?.discount}% off',
                                style: const TextStyle(color: Colors.red),
                              ),
                              verticalSpace(4.h),
                              Text(
                                "${cubit.getCartModel?.data?.cartItems?[index].product?.oldPrice.toString() ?? ""} EGP",
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                      ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
