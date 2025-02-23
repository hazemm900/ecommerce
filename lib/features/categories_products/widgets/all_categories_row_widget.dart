import 'package:ecommerce/core/helper/spacing.dart';
import 'package:ecommerce/core/services/service_locator.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_cubit.dart';
import 'package:ecommerce/features/categories_products/logic/categories_cubit/categories_state.dart';
import 'package:ecommerce/features/categories_products/screens/category_details_screen.dart';
import 'package:ecommerce/features/categories_products/widgets/category_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllCategoriesRowWidget extends StatelessWidget {
  const AllCategoriesRowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoriesCubit>()..getCategories(),
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          var cubit = CategoriesCubit.get(context);
          return cubit.categoriesModel == null
              ? const SizedBox()
              : SizedBox(
                  height: 100.h,
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        cubit.categoriesModel!.data!.categoryItem!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CategoryDetailsScreen(
                                        categoryId: cubit.categoriesModel?.data
                                                ?.categoryItem?[index].id ??
                                            0,
                                        categoryName: cubit
                                                .categoriesModel
                                                ?.data
                                                ?.categoryItem?[index]
                                                .name ??
                                            "",
                                      )));
                        },
                        child: CategoryWidgetItem(
                            categoryItem: cubit
                                .categoriesModel!.data!.categoryItem![index]),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return horizontalSpace(16.w);
                    },
                  ),
                );
        },
      ),
    );
  }
}
