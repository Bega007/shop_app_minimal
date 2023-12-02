import 'package:flutter/material.dart';
import 'package:minimal_markt/models/product.dart';
import 'package:minimal_markt/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({super.key, required this.product});

  //add to cart button pressed
  void addToCart(BuildContext context) {
    //show a dialog box to ask user to confirm to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Add this item to your cart?'),
        actions: [
          //cancel Button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          //yes Button
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.pop(context);

              //add to cart
              context.read<Shop>().addToCart(product);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(  
      onTap: () => Navigator.pushNamed(
                context, '/product_detail_page'),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              blurRadius: 50,
              spreadRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(8),
        width: 180,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //product image
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.all(5),
                      child: Positioned(
                        top: 10,
                        child: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.amber.withOpacity(0.8),
                              ),
                              child: const Text(
                                '25%',
                                style: TextStyle(
                                    color: Colors.black),
                              ),
                            ),
                            Image.asset(product.imagePath),

                            //favourite icon
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  //color: Theme.of(context).colorScheme.inversePrimary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(
                height: 1,
              ),

              //product name
              Text(
                product.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
                textAlign: TextAlign.left,
              ),

              //product description
              Text(
                product.description,
                style: TextStyle(
                    //color: Theme.of(context).colorScheme.,
                    ),
              ),

              const SizedBox(
                height: 10,
              ),

              //product price + add to cart button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //product price
                  Text('\$${product.price.toStringAsFixed(2)}'),

                  //add to cart button
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: SizedBox(
                      width: 32 * 1.2,
                      height: 32 * 1.2,
                      child: IconButton(
                        onPressed: () => addToCart(context),
                        icon: const Icon(
                          Icons.add,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
