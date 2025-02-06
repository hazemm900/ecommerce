import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_cubit.dart';
import 'package:ecommerce/features/cart/logic/cart_cubit/carts_state.dart';
import 'package:ecommerce/features/cart/widgets/product_in_cart_details_widget.dart';
import 'package:ecommerce/features/cart/widgets/product_in_cart_price_widget.dart';
import 'package:ecommerce/features/cart/widgets/total_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CartListWidget extends StatelessWidget {
  const CartListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartsCubit, CartsState>(
      bloc: getIt<CartsCubit>()..getAllCarts(),
      builder: (context, state) {
        var cubit = getIt<CartsCubit>();
        return cubit.getCartModel?.data?.cartItems == null
            ?  Center(
                child: SpinKitHourGlass(
                  color: MyColors.myMutedGold,
                  size: 50.0.r,
                ))
            : Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cubit.getCartModel!.data!.cartItems!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomNetworkImage(
                                    image: cubit.getCartModel?.data?.cartItems?[index].product?.image ?? "",
                                    width: 130.w,
                                    height: 125.h,
                                  ),
                                  horizontalSpace(10.w),
                                  ProductInCartDetailsWidget(index: index)
                                ],
                              ),
                              const Divider(
                                thickness: 1.3,
                                color: MyColors.myMutedGold,
                              ),
                              ProductInCartPriceWidget(index: index),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const TotalCartWidget()
                ],
              );
      },
    );
  }
}
