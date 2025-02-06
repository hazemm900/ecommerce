import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/favorites/logic/favorites_cubit/favorites_cubit.dart';
import 'package:ecommerce/features/favorites/logic/favorites_cubit/favorites_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInFavoritesDetailsWidget extends StatelessWidget {
  const ProductInFavoritesDetailsWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      bloc: getIt<FavoritesCubit>(),
      builder: (context, state) {
        var cubit = getIt<FavoritesCubit>();
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cubit.favoritesModel?.data?.data?[index].product?.name ?? "",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              verticalSpace(10.h),
              Row(
                children: [
                  Text(
                    "${cubit.favoritesModel?.data?.data?[index].product?.price.toString() ?? ""} EGP",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                        color: Colors.green),
                  ),
                  horizontalSpace(16.w),
                  cubit.favoritesModel?.data?.data?[index].product?.discount ==
                          0
                      ? const SizedBox()
                      : Flexible(
                        child: Column(
                            children: [
                              Text(
                                'up to ${cubit.favoritesModel?.data?.data?[index].product?.discount}% off',
                                style: const TextStyle(color: Colors.red),
                              ),
                              verticalSpace(4.h),
                              Text(
                                "${cubit.favoritesModel?.data?.data?[index].product?.oldPrice.toString() ?? ""} EGP",
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
