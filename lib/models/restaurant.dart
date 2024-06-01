import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:full_shop/models/cart_item.dart';
import 'package:full_shop/models/food.dart';

class Restaurant with ChangeNotifier {
  // list of food menu
  final List<Food> _menu = [
    // burgers
    Food(
        name: "Classic Cheeseburger",
        description: 'A juicy beef patty with melted cheddar, lettuce',
        imagePath: "lib/images/burgers/burger-1.jpg",
        price: 0.88,
        category: FoodCategory.burgers,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Uyo Cheeseburger",
        description: 'A juicy beef patty with melted cheddar, lettuce',
        imagePath: "lib/images/burgers/burger-2.jpg",
        price: 0.88,
        category: FoodCategory.burgers,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 3.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 1.99)
        ]),
    Food(
        name: "Premium Cheeseburger",
        description: 'A juicy beef patty with melted cheddar, lettuce',
        imagePath: "lib/images/burgers/burger-3.jpg",
        price: 0.88,
        category: FoodCategory.burgers,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 3.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic burger",
        description: 'A greesy burger beef patty with melted cheddar, lettuce',
        imagePath: "lib/images/burgers/burger-4.jpg",
        price: 0.88,
        category: FoodCategory.burgers,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic Cheeseburger",
        description: 'A juicy beef patty with melted cheddar, lettuce',
        imagePath: "lib/images/burgers/burger-1.jpg",
        price: 0.88,
        category: FoodCategory.burgers,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    // salads
    Food(
        name: "Classic Salad 1",
        description: 'The vegan\'s true happiness',
        imagePath: "lib/images/salads/salad-1.jpg",
        price: 0.99,
        category: FoodCategory.salads,
        avaialableAddons: [
          Addon(name: 'Extra cream', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic Salad 2",
        description: 'The vegan\'s true happiness',
        imagePath: "lib/images/salads/salad-2.jpg",
        price: 0.99,
        category: FoodCategory.salads,
        avaialableAddons: [
          Addon(name: 'Extra cream', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic Salad 3",
        description: 'The vegan\'s true happiness',
        imagePath: "lib/images/salads/salad-3.jpg",
        price: 0.99,
        category: FoodCategory.salads,
        avaialableAddons: [
          Addon(name: 'Extra cream', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic Salad 4",
        description: 'The vegan\'s true happiness',
        imagePath: "lib/images/salads/salad-2.jpg",
        price: 0.99,
        category: FoodCategory.salads,
        avaialableAddons: [
          Addon(name: 'Extra cream', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic Salad 5",
        description: 'The vegan\'s true happiness',
        imagePath: "lib/images/salads/salad-1.jpg",
        price: 0.99,
        category: FoodCategory.salads,
        avaialableAddons: [
          Addon(name: 'Extra cream', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),

    // sides
    Food(
        name: "Classic sides 1",
        description: 'Fries that tastes good',
        imagePath: "lib/images/sides/sides-1.jpg",
        price: 0.88,
        category: FoodCategory.sides,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic sides 2",
        description: 'Fries that tastes good',
        imagePath: "lib/images/sides/sides-2.jpg",
        price: 0.88,
        category: FoodCategory.sides,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),

    // deserts
    Food(
        name: "Classic desserts",
        description: 'Enhance your appetite...',
        imagePath: "lib/images/dessert/dessert-1.jpg",
        price: 0.88,
        category: FoodCategory.desserts,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic desserts 2",
        description: 'Enhance your appetite...',
        imagePath: "lib/images/dessert/dessert-2.jpg",
        price: 0.88,
        category: FoodCategory.desserts,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Classic desserts 3",
        description: 'Enhance your appetite...',
        imagePath: "lib/images/dessert/dessert-3.jpg",
        price: 0.88,
        category: FoodCategory.desserts,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),

    //drinks

    Food(
        name: "Smoothie",
        description: 'Fruit smoothie',
        imagePath: "lib/images/drinks/drink-1.jpg",
        price: 0.88,
        category: FoodCategory.drinks,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Wine",
        description: 'Fruit smoothie',
        imagePath: "lib/images/drinks/drink-2.jpg",
        price: 0.88,
        category: FoodCategory.drinks,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
    Food(
        name: "Smoothie",
        description: 'Fruit smoothie',
        imagePath: "lib/images/drinks/drink-3.jpg",
        price: 0.88,
        category: FoodCategory.drinks,
        avaialableAddons: [
          Addon(name: 'Extra cheese', price: 0.99),
          Addon(name: 'Bacon', price: 1.99),
          Addon(name: 'Avocado', price: 2.99)
        ]),
  ];

  // Getters

  List<Food> get menu => _menu;

  // OPERATIONS

  // User cart
  final List<CartItem> _cart = [];

  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // see if selected food exists already and increase the quantity
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      // check if the food item is the same
      bool isSameFood = item.food == food;

      // check if selected addons are the same
      bool isSameAddons =
          ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameAddons & isSameFood;
    });

    // if item already exist, increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    } // otherwise add a new cart item
    else {
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons),
      );
    }
    notifyListeners();
  }

  // remove from cart
  void removerFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      if(_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      }else{
        _cart.remove(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddons){
        itemTotal = addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;

    for (CartItem cartItem in _cart){
      totalItemCount = cartItem.quantity;
    }

    return totalItemCount;
  }

  // clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  // HELPERS

  // generate a receipt

  // format double value into money

  //format list of addons into a string summary
}
