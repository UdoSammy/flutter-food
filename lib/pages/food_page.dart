// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:full_shop/components/my_button.dart';
import 'package:full_shop/models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;

  final Map<Addon, bool> selectedAddons = {};
  FoodPage({super.key, required this.food}) {
    // initialize selected addon to be false
    for (Addon addon in food.avaialableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food, Map<Addon, bool> selectedAddons){
    
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(widget.food.imagePath),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.food.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '\$' + widget.food.price.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.food.description,
                      ),

                      const SizedBox(
                        height: 25,
                      ),

                      // addons

                      Text(
                        'Add-ons',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).colorScheme.secondary),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: widget.food.avaialableAddons.length,
                            itemBuilder: (context, index) {
                              Addon addon = widget.food.avaialableAddons[index];
                              return CheckboxListTile(
                                title: Text(addon.name),
                                subtitle: Text(
                                  '\$${addon.price}',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                                ),
                                value: widget.selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddons[addon] = value!;
                                  });
                                },
                              );
                            }),
                      )
                    ],
                  ),
                ),
                MyButton(
                  text: 'Add to Cart',
                  onTap: () => addToCart(widget.food.widget.selectedAddons),
                ),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
        // back button

        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
