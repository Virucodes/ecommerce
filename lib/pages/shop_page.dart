import 'package:ecommerce/components/my_category_selector.dart';
import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_new_product.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<Shop>().fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final shopProvider = context.watch<Shop>();

    // Get unique categories
    final allCategories = [
      'All',
      ...{...shopProvider.shop.map((p) => p.category)}
    ];

    // Filter products by selected category
    final filteredProducts = selectedCategory == "All"
        ? shopProvider.shop
        : shopProvider.shop
            .where((p) => p.category == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          TextButton.icon(
            label: Text(
              "New Product",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyNewProduct(
                  onAddProduct: (product) {
                    Provider.of<Shop>(context, listen: false)
                        .addNewProduct(product);
                  },
                ),
              ),
            ),
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: shopProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                const SizedBox(height: 25),
                Center(
                  child: Text(
                    "Pick from a selected list of premium products",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                // 🔥 Category Selector Component
                MyCategorySelector(
                  categories: allCategories,
                  selectedCategory: selectedCategory,
                  onCategorySelected: (category) {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 550,
                  child: ListView.builder(
                    itemCount: filteredProducts.length,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return MyProductTile(product: product);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
