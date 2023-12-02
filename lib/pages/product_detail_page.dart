import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_app_bar.dart';
import 'package:minimal_markt/components/my_circular_icon.dart';
import 'package:minimal_markt/components/my_rounded_image.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1 - Product Image Slider
            Stack(children: [
              const SizedBox(
                height: 350,
                child: Padding(
                  padding: EdgeInsets.all(20.0 * 2),
                  child: Center(
                    child: Image(
                      image: AssetImage('assets/hoodie/1.png'),
                    ),
                  ),
                ),
              ),
              //Image Slider
              Positioned(
                right: 0,
                bottom: 30,
                left: 24,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    separatorBuilder: (_, __) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (_, index) => const MyRoundedImage(
                        width: 80,
                        padding: EdgeInsets.all(2),
                        backgroundColor: Colors.blue,
                        //border: Border.all(color: Colors.blue),
                        imageUrl: 'assets/hoodie/2.jpeg'),
                  ),
                ),
              ),
              //Appbar Icons
              const MyAppBar(
                showBackArrow: true,
                actions: [
                  MyCircularIcon(icon: Icons.favorite, color: Colors.red),
                ],
              ),
            ]),

            //2 - Product Details
            const Padding(
              padding: EdgeInsets.only(right: 12, left: 12, bottom: 12),
              child: Column(
                children: [
                  // -Rating & share
                  // -Price,Title,Stock & Brand
                  // -Attributes
                  // -Checkout Button
                  //- Description
                  // -Reviews
                ],
              ),
            ),

            //3 - Buttons
          ],
        ),
      ),
    );
  }
}
