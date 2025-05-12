class Food{
  final String name;      //cheese burger
  final String description;//a burger full of cheese
  final String imagePath; //lib/images/cheese_burger.png
  final double price;     //4.99
  final FoodCategory category;//burger
  List<Addon>availableAddons;
//[extra cheese,sauce,extra patty]
  Food({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
});
  // factory Food.fromJson(Map<String, dynamic> json) {
  //   return Food(
  //     name: json['name'],
  //     description: json['description'],
  //     imagePath: json['imagePath'],
  //     price: json['price'].toDouble(),
  //     category: FoodCategory.values.firstWhere(
  //           (e) => e.toString().split('.').last == json['category'],
  //     ),
  //     availableAddons: (json['availableAddons'] as List)
  //         .map((addonJson) => Addon.fromJson(addonJson))
  //         .toList(),
  //   );
  // }
}
//food categories
 enum FoodCategory{
  burgers,
   salads,
   sides,
   desserts,
   drinks,
 }
 //food addons
class Addon{
  String name;
  double price;
  Addon({
    required this.price,
    required this.name,
});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Food &&
        other.name == name &&
        other.price == price ;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
  // factory Addon.fromJson(Map<String, dynamic> json) {
  //   return Addon(
  //     name: json['name'],
  //     price: json['price'].toDouble(),
  //   );
  // }
}