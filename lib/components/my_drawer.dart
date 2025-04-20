import 'package:ecommerce/components/my_list_tile.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:ecommerce/pages/update_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // Drawer header: logo
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              // Shop tile
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              // Cart tile
              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  // Pop first drawer
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '/cart_page');
                },
              ),

              // User profile tile
              MyListTile(
                text: "Profile",
                icon: Icons.person,
                onTap: () {
                  // Pop first drawer
                  Navigator.pop(context);

                  Navigator.pushNamed(context, '/profile_page');
                },
              ),

              // Update products tile
              MyListTile(
                text: "Update Products",
                icon: Icons.update,
                onTap: () async {
                  Navigator.pop(context);

                  // First load the products (it doesn't return anything)
                  await context.read<Shop>().loadProductsFromLocal();

                  // Now get the actual list from Shop provider
                  final products = context
                      .read<Shop>()
                      .shop; // make sure you have a `products` getter

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProductPage(
                        products: products,
                        onUpdate: (Product updated, int index) {
                          context.read<Shop>().updateProduct(updated, index);
                        },
                      ),
                    ),
                  );
                },
              ),
            ],
          ),

          // Exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, '/intro_page', (route) => false),
            ),
          ),
        ],
      ),
    );
  }
}
