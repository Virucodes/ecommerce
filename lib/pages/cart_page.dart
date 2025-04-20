import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: const Text("Remove this item from your cart?"),
              actions: [
                //cancel button

                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel"),
                ),

                // yes button

                MaterialButton(
                  onPressed: () {
                    //pop dialog box
                    Navigator.pop(context);

                    // remove from the cart

                    context.read<Shop>().removeFromCart(product);
                  },
                  child: const Text("Yes"),
                )
              ],
            ));
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text(
                  "User wants to pay! Connect this app to your payment backend"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          // cart list

          Expanded(
              child: cart.isEmpty
                  ? const Center(child: Text("Your Cart is empty.."))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        // get individual item in cart
                        final item = cart[index];

                        //return as a list tile
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Container(
                            height:
                                100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Product image
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      item.image,
                                      height: 60,
                                      width: 60,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(Icons.error),
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return const SizedBox(
                                          height: 60,
                                          width: 60,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                                strokeWidth: 2),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),

                                // Product details
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0, horizontal: 8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          item.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14, // smaller font size
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "₹${item.price.toStringAsFixed(2)}",
                                          style: TextStyle(
                                              fontSize: 13,
                                              color: Theme.of(context).colorScheme.inversePrimary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Remove icon
                                IconButton(
                                  
                                  icon:  Icon(Icons.cancel,
                                      color: Theme.of(context).colorScheme.inversePrimary),
                                  onPressed: () =>
                                      removeItemFromCart(context, item),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),

          // pay button
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyButton(
                onTap: () => payButtonPressed(context),
                child: const Text("PAY NOW")),
          )
        ],
      ),
    );
  }
}
