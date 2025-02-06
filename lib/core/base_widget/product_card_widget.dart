import 'package:ecommerce/core/base_widget/custom_cached_network_image.dart';
import 'package:ecommerce/core/theme/color.dart';
import 'package:ecommerce/features/categories_products/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget(
      {super.key,
      required this.index,
      required this.productImage,
      required this.productName,
      required this.productDescription,
      required this.productPrice,
      required this.productOldPrice,
      required this.productId,
      required this.productTitleName});

  final int index;
  final String productImage;
  final String productName;
  final String productDescription;
  final String productPrice;
  final String productOldPrice;

  final int productId;
  final String productTitleName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                    productId: productId)));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                  borderRadius:
                       BorderRadius.vertical(top: Radius.circular(10.r)),
                  child: CustomNetworkImage(image: productImage)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(productName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.displayMedium),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(productDescription,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: MyColors.myGrey)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        productPrice,
                        style: const TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        productOldPrice,
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
      ),
    );
  }
}
