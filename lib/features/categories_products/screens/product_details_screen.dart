import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/base_widget/custom_elevated_button.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_state.dart';
import 'package:ecommerce/features/categories_products/widgets/cart_and_favorite_buttons_widget.dart';
import 'package:ecommerce/features/categories_products/widgets/favorite_button_widget.dart';
import 'package:ecommerce/features/categories_products/widgets/product_carousel_slider_widget.dart';
import 'package:ecommerce/features/categories_products/widgets/product_pricing_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: getIt<CategoriesCubit>()..getProductsDetails(productId),
      builder: (context, state) {
        var cubit = getIt<CategoriesCubit>();
        var productItem = cubit.productDetailsModel?.data;
        return Scaffold(
          appBar: const CustomAppBar(appBarTitle: "product Details"),
          body: cubit.productDetailsModel == null
              ? Center(
                  child: SpinKitHourGlass(
                    color: MyColors.myMutedGold,
                    size: 50.0.r,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ProductCarouselSliderWidget(),
                        verticalSpace(44.h),
                        Text(
                          productItem?.name ?? "no name",
                          style: TextStyle(
                              color: MyColors.myMutedGold,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        verticalSpace(8.h),
                        const ProductPricingRowWidget(),
                        verticalSpace(8.h),
                        Text(
                          "Product Details",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                        verticalSpace(4.h),
                        Text(
                          productItem?.description ?? "no description",
                          style: TextStyle(
                              fontSize: 14.sp, fontWeight: FontWeight.w500),
                        ),
                        verticalSpace(12.h),
                        Row(
                          children: [
                            productItem?.inCart == false
                                ? Expanded(
                                    child: CartAndFavoritesButtonsWidget(
                                      productId: productId,
                                      buttonColor: Colors.green.shade500,
                                      buttonLabel: 'Add Cart',
                                      buttonIcon: Icons.shopping_cart_outlined,
                                    ),
                                  )
                                : Expanded(
                                    child: CartAndFavoritesButtonsWidget(
                                      productId: productId,
                                      buttonColor: Colors.red.shade500,
                                      buttonLabel: 'Remove Cart',
                                      buttonIcon:
                                          Icons.remove_shopping_cart_outlined,
                                    ),
                                  ),
                            horizontalSpace(12.w),
                            productItem?.inFavorites == false
                                ? Expanded(
                                    child: FavoriteButtonWidget(
                                        productId: productId,
                                        buttonColor: Colors.green.shade500,
                                        buttonLabel: "Add Favorites ",
                                        buttonIcon:
                                            Icons.favorite_border_outlined),
                                  )
                                : Expanded(
                                    child: FavoriteButtonWidget(
                                        productId: productId,
                                        buttonColor: Colors.red.shade500,
                                        buttonLabel: "Remove Favorite ",
                                        buttonIcon: Icons.favorite),
                                  ),
                          ],
                        ),
                        verticalSpace(12.h),
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
