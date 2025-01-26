import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductPricingRowWidget extends StatelessWidget {
  const ProductPricingRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: getIt<CategoriesCubit>(),
      builder: (context, state) {
        var cubit = getIt<CategoriesCubit>();
        var productItem = cubit.productDetailsModel?.data;
        return Row(
          children: [
            Text(
              "${productItem?.oldPrice.toString() ?? ""} EGP",
              style: const TextStyle(
                  color: MyColors.myLightGrey,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.lineThrough),
            ),
            horizontalSpace(8),
            Text(
              "${productItem?.price.toString() ?? ""} EGP",
              style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            horizontalSpace(8),
            Text(
              "${productItem?.discount.toString() ?? ""} % Off",
              style: const TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }
}
