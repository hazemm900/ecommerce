import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/base_widget/product_card_widget.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen(
      {super.key, required this.categoryId, required this.categoryName});

  final int categoryId;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<CategoriesCubit>()..getCategoryDetails(categoryId),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          var cubit = CategoriesCubit.get(context);
          var itemDetails =
              cubit.categoryDetailsModel?.data?.categoryItemDetails;
          return Scaffold(
            appBar: CustomAppBar(title: categoryName),
            body: cubit.categoryDetailsModel == null
                ? Center(
                    child: SpinKitHourGlass(
                    color: MyColors.myMutedGold,
                    size: 50.0.r,
                  ))
                : GridView.builder(
                    itemCount: cubit.categoryDetailsModel?.data
                            ?.categoryItemDetails?.length ??
                        0,
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCardWidget(
                        index: index,
                        productImage: itemDetails?[index].image ?? "",
                        productName: itemDetails?[index].name ?? "",
                        productDescription:
                            itemDetails?[index].description ?? "",
                        productPrice:
                            itemDetails?[index].price.toString() ?? "",
                        productOldPrice:
                            itemDetails?[index].oldPrice.toString() ?? "",
                        productId: itemDetails?[index].id ?? 0,
                        productTitleName: itemDetails?[index].name ?? "",
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
