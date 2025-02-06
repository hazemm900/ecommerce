import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/home/logic/home_cubit/home_cubit.dart';
import 'package:ecommerce/features/home/logic/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      bloc: getIt<HomeCubit>(),

      builder: (context, state) {
        var cubit = getIt<HomeCubit>();
        return Card(
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius:
                         BorderRadius.vertical(top: Radius.circular(10.r)),
                    child: CustomNetworkImage(
                        image: cubit.homeModel?.data?.products?[index].images
                                ?.first ??
                            "")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    cubit.homeModel?.data?.products?[index].name ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    cubit.homeModel?.data?.products?[index].description ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:  TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: MyColors.myGrey)),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          cubit.homeModel?.data?.products?[index].price
                                  .toString() ??
                              "",
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          cubit.homeModel?.data?.products?[index].oldPrice
                                  .toString() ??
                              "",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon:  Icon(
                        Icons.favorite,
                        color: Colors.amber,
                        size: 16.r,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
