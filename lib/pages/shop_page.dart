import 'package:flutter/material.dart';
import 'package:minimal_markt/components/my_adds.dart';
import 'package:minimal_markt/components/my_drawer.dart';
import 'package:minimal_markt/components/my_product_tile.dart';
import 'package:minimal_markt/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

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
          'Shop Page',
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
      body: ListView(children: [
        const SizedBox(
          height: 25,
        ),

        //shop subtitle
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
          ),
        ),

        const SizedBox(
          height: 25,
        ),

        const MyAdds(),

        const SizedBox(
          height: 25,
        ),

        //Categories
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Column(
                  children: [
                    //circular icon
                    Container(
                      width: 56,
                      height: 56,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(180),
                      ),
                      child: const Center(
                        child: Image(
                          image: AssetImage('assets/hoodie/1.png'),
                          fit: BoxFit.cover,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    //Text
                    const SizedBox(
                      width: 55,
                      child: Text(
                        'hoodie',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        GridView.builder(
          shrinkWrap: true,
          itemCount: products.length,
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
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 288,
          ),
        ),
      ]),
    );
  }
}
