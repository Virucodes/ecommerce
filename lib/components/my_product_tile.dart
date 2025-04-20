import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({
    super.key,
    required this.product,
  });

  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Add to Cart"),
        content: const Text("Do you want to add this item to your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product);

              // Show success animation
             // Show success Lottie animation with faster speed
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.transparent,
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        late final AnimationController controller;

                        return SizedBox(
                          height: 200,
                          child: Lottie.asset(
                            'assets/lottie/success.json',
                            repeat: false,
                            controller: controller = AnimationController(
                              vsync: Navigator.of(context),
                              duration: const Duration(milliseconds: 1000), // Faster
                            )..forward(),
                            onLoaded: (composition) {
                              controller.forward().whenComplete(() {
                                Navigator.pop(context); // Close after animation
                              });
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      padding: const EdgeInsets.all(16),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.secondary,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Product name
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 8),

          // Description
          Text(
            product.description,
            style: TextStyle(
              fontSize: 14,
              color: colorScheme.inversePrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),

          const SizedBox(height: 16),

          // Price + Add button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add_shopping_cart_rounded),
                  onPressed: () => addToCart(context),
                  tooltip: "Add to Cart",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
