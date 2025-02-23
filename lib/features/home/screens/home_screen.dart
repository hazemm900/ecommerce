import 'package:ecommerce/core/base_widget/custom_app_bar.dart';
import 'package:ecommerce/features/categories_products/widgets/all_categories_row_widget.dart';
import 'package:ecommerce/features/home/widgets/home_gridview_widget.dart';
import 'package:ecommerce/features/home/widgets/sort_and_filter_row_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Home"),
      body: Column(
        children: [
          SortAndFilterRowWidget(),
          AllCategoriesRowWidget(),
          HomeGridViewWidget()
        ],
      ),
    );
  }
}
