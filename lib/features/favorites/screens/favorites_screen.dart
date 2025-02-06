import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:ecommerce/features/favorites/logic/favorites_cubit/favorites_state.dart';
import 'package:ecommerce/features/favorites/widgets/product_in_favorites_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      bloc: getIt<FavoritesCubit>()..getFavorites(),
      builder: (context, state) {
        var cubit = getIt<FavoritesCubit>();
        return Scaffold(
          appBar: const CustomAppBar(appBarTitle: "Favorites"),
          body: cubit.favoritesModel == null
              ? Center(
                  child: SpinKitHourGlass(
                  color: MyColors.myMutedGold,
                  size: 50.0.r,
                ))
              : SingleChildScrollView(
                child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.favoritesModel!.data!.data!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 8.h),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomNetworkImage(
                                        image: cubit.favoritesModel?.data
                                                ?.data?[index].product?.image ??
                                            "",
                                        width: 130.w,
                                        height: 125.h,
                                      ),
                                      horizontalSpace(10.w),
                                      ProductInFavoritesDetailsWidget(
                                          index: index)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
              ),
        );
      },
    );
  }
}
