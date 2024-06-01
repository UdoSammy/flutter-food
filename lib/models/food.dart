class Food {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final FoodCategory category;
  List<Addon> avaialableAddons;

  Food(
      {
      required this.name,
      required this.description,
      required this.imagePath,
      required this.price,
       required this.category,
      required this.avaialableAddons,
  });
}

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

// Addons for food
class Addon {
  String name;
  double price;

  Addon({required this.name, required this.price});
}
