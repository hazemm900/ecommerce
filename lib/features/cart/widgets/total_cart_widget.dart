import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_cubit.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalCartWidget extends StatelessWidget {
  const TotalCartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      bloc: getIt<CartsCubit>(),
      builder: (context, state) {
        var cubit = getIt<CartsCubit>();

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 60.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: MyColors.myMutedGold,
            ),
            child: Row(
              children: [
                Text(
                  "Total Order: ",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                const Spacer(),
                Text(
                  "${cubit.getCartModel?.data?.total.toString() ?? ""} EGP",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
