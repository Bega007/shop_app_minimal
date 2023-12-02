import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_circular_image.dart';
import 'package:minimal_markt/components/my_product_price.dart';
import 'package:minimal_markt/components/my_product_title_text.dart';
import 'package:minimal_markt/themes/dark_mode.dart';

class MyProductData extends StatelessWidget {
  const MyProductData({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price &Sale Price
        Row(
          children: [
            // Sale Tag

            SizedBox(
              width: 10,
            ),

            // Price
            Text(
              '\$250',
              style: TextStyle(
                fontSize: 8,
                decoration: TextDecoration.lineThrough,
              ),
            ),

            SizedBox(
              width: 12,
            ),

            MyProductPrice(price: '175', isLarge: true),
          ],
        ),

        SizedBox(
          height: 12,
        ),

        //title
        MyProductTitleText(
          title: 'Green Nike Hoodie',
        ),

        SizedBox(
          height: 12,
        ),

        //Stock Status
        Row(
          children: [
            MyProductTitleText(title: 'Status'),
            SizedBox(
              width: 12,
            ),
            Text('In Stock')
          ],
        ),

        SizedBox(
          height: 12,
        ),

        //Brand
        MyProductData(),
      ],
    );
  }
}
