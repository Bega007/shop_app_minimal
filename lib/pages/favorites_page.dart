import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_drawer.dart';
import 'package:minimal_markt/components/my_product_tile.dart';
import 'package:minimal_markt/models/shop.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {

     //access products in shop
    final products = context.watch<Shop>().shop;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Whishlist',
        ),
        //go to cart page
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [

              GridView.builder(
          shrinkWrap: true,
          itemCount: 4,//products.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(25),
          itemBuilder: (context, index) {
            //get each individual product from shop
            final product = products[index];
        
            //return as a product tile UI
            return MyProductTile(product: product);
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            mainAxisExtent: 288,
          ),
        ),
          
          
          ],
          ),
        ),
      ),
    );
  }
}
