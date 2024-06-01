// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:full_shop/components/my_current_location.dart';
import 'package:full_shop/components/my_description_box.dart';
import 'package:full_shop/components/my_drawer.dart';
import 'package:full_shop/components/my_food_tile.dart';
import 'package:full_shop/components/my_sliver_app_bar.dart';
import 'package:full_shop/components/my_tab_bar.dart';
import 'package:full_shop/models/food.dart';
import 'package:full_shop/models/restaurant.dart';
import 'package:full_shop/pages/food_page.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  // return the food in the given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: categoryMenu.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodPage(food: food),
                ),
              );
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppBar(
                  title: MyTabBar(tabController: _tabController),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.secondary,
                      ),

                      // my current location
                      MyCurrentLocation(),

                      // description box

                      MyDescriptionBox(),
                    ],
                  ),
                )
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu)),
          )),
    );
  }
}
