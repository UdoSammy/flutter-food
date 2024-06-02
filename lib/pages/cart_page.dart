// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:full_shop/components/my_button.dart';
import 'package:full_shop/components/my_cart_tile.dart';
import 'package:full_shop/models/restaurant.dart';
import 'package:full_shop/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      // access the cart
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title:
                              Text('Are you sure you ant to clear the cart?'),
                          actions: [
                            // cancel button
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            //yes button
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: Text('Yes'),
                            ),
                          ],
                        ));
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: Column(
          children: [
            // List of cart items
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(
                          child: Center(child: Text('Your cart is empty...')))
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                final cartItem = userCart[index];

                                return MyCartTile(cartItem: cartItem);
                              }),
                        ),
                ],
              ),
            ),

            // Button to pay
            MyButton(
              text: 'Go to checkout',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PaymentPage(),
                ),
              ),
            ),

            const SizedBox(
              height: 25,
            )
          ],
        ),
      );
    });
  }
}
