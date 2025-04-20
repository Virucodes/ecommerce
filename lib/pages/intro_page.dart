import 'package:ecommerce/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(50),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(25), // Match the container's radius
                  child: Lottie.asset(
                    'assets/lottie/shop.json',
                    repeat: true,
                    alignment: Alignment.center,
                    fit: BoxFit
                        .cover, // Fill the space while respecting the corners
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // title
              const Text("Minimal Shop",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),

              const SizedBox(height: 25),

              // subtitle
              Text(
                "Premium Quality Products",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(height: 25),

              // button
              MyButton(
                onTap: () => Navigator.pushNamed(context, '/shop_page'),
                child: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ));
  }
}
