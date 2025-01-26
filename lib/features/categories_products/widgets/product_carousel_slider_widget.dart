import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCarouselSliderWidget extends StatelessWidget {
  const ProductCarouselSliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      bloc: getIt<CategoriesCubit>(),
      builder: (context, state) {
        var cubit = getIt<CategoriesCubit>();
        var productItem = cubit.productDetailsModel?.data;
        return CarouselSlider(
          options: CarouselOptions(
            height: 235,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.easeInOut,
          ),
          items: productItem?.images?.toList().map((productImages) {
            return Builder(
              builder: (BuildContext context) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: CustomNetworkImage(image: productImages),
                  ),
                );
              },
            );
          }).toList(),
        );
      },
    );
  }
}
