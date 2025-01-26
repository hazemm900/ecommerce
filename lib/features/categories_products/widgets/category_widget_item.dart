import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/features/categories_products/data/model/categories_model.dart';
import 'package:flutter/material.dart';

class CategoryWidgetItem extends StatelessWidget {
  final CategoryItem categoryItem;

  const CategoryWidgetItem({super.key, required this.categoryItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomNetworkImage(
            image: categoryItem.image ?? "", height: 100, width: 100),
        verticalSpace(4),
        Text(
          categoryItem.name ?? "",
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
