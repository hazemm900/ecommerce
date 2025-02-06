import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/features/categories_products/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            image: categoryItem.image ?? "", height: 100.h, width: 100.w),
        verticalSpace(4.h),
        Text(
          categoryItem.name ?? "",
          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
