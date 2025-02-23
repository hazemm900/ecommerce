import 'package:ecommerce/core/base_widget/product_card_widget.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/home/logic/home_cubit/home_cubit.dart';
import 'package:ecommerce/features/home/logic/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeGridViewWidget extends StatelessWidget {
  const HomeGridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getHome(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (BuildContext context, state) {
          var homeCubit = BlocProvider.of<HomeCubit>(context);
          var productItem = homeCubit.homeModel?.data?.products;
          return state is HomeLoadingState
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SpinKitHourGlass(
                    color: MyColors.myMutedGold,
                    size: 50.0.sp,
                  ),
                ))
              : Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: productItem?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ProductCardWidget(
                        index: index,
                        productImage: productItem?[index].image ?? "",
                        productName: productItem?[index].name ?? "",
                        productDescription:
                            productItem?[index].description ?? "",
                        productPrice:
                            "${productItem?[index].price?.toString()} EGP",
                        productOldPrice: productItem?[index].discount == 0
                            ? ""
                            : "${productItem?[index].oldPrice?.toString()} EGP",
                        productId: productItem?[index].id ?? 0,
                        productTitleName: productItem?[index].name ?? "",
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
