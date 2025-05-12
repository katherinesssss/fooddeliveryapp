import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import 'cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  final List<CartItem> _cart = [];

  // Restaurant() {
  //   _loadMenuFromJson();
  // }
  //
  // Future<void> _loadMenuFromJson() async {
  //   try {
  //     final jsonString = await rootBundle.loadString('assets/data/menu.json');
  //     final jsonList = jsonDecode(jsonString) as List;
  //
  //     _menu = jsonList.map((json) => Food.fromJson(json)).toList();
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint('Error loading menu: $e');
  //     // Можно добавить fallback-меню или обработку ошибки
  //   }
  // }
  final List<Food> _menu = [
    //burgers
    Food(
      name: "Classic Cheeseburger",
      description: "A juicy beef patty with melted cheddar, lettuce,tomato, and a hint of onion and pickle.",
      imagePath:"lib/images/food/burgers/Burger.png",
      price:0.99,
      category:FoodCategory.burgers,
      availableAddons:[
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic Chickenburger",
      description: "Chicken burgers are a popular type of burger that is made with ground chicken meat.",
      imagePath:"lib/images/food/burgers/burger2.png",
      price:0.99,
      category:FoodCategory.burgers,
      availableAddons:[
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Fishburger",
      description: "Fishburger, served with summer vegetables and remoulade.",
      imagePath:"lib/images/food/burgers/burger3.png",
      price:0.99,
      category:FoodCategory.burgers,
      availableAddons:[
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Chickenburger barbecue",
      description: "A BBQ chicken burger is a mouthwatering burger that combines the savory flavors of a homemade, crumb-coated juicy chicken patty.",
      imagePath:"lib/images/food/burgers/burger4.png",
      price:0.99,
      category:FoodCategory.burgers,
      availableAddons:[
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Double Hamburger ",
      description: "The Deluxe Double Hamburger is a classic American burger made with two beef patties, cheese, lettuce, tomato, onion, pickles, and special sauce.",
      imagePath:"lib/images/food/burgers/burger5.png",
      price:0.99,
      category:FoodCategory.burgers,
      availableAddons:[
        Addon(name: "Extra cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    //salads
    Food(
      name: "Cucumber salad with sauce",
      description: "A yammy salad for u if you follow the weight",
      imagePath:"lib/images/food/salads/Cucumber salad.jpg",
      price:0.99,
      category:FoodCategory.salads,
      availableAddons:[
        Addon(name: "Extra carrot", price: 0.99),
        Addon(name: "Cabbage", price: 1.99),
        Addon(name: "Lemon", price: 2.99),
      ],
    ),
    Food(
      name: "Salad with cucumber in oil",
      description: "Cucumber.Nothing extra.",
      imagePath:"lib/images/food/salads/Cucumber salad (1).jpg",
      price:0.99,
      category:FoodCategory.salads,
      availableAddons:[
        Addon(name: "Extra tuna", price: 0.99),
        Addon(name: "Cabbage", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Tuna salad",
      description: "Wanna more protein and extra vegetables? This option for you.",
      imagePath:"lib/images/food/salads/Healthy Food.jpg",
      price:0.99,
      category:FoodCategory.salads,
      availableAddons:[
        Addon(name: "Extra carrot", price: 0.99),
        Addon(name: "Cabbage", price: 1.99),
        Addon(name: "Lemon", price: 2.99),
      ],
    ),
    Food(
      name: "Vegan Greek Salad",
      description: "A greate salad if u love mix of cheese and vegetables.",
      imagePath:"lib/images/food/salads/Vegan Greek Salad - Cupful of Kale.jpg",
      price:0.99,
      category:FoodCategory.salads,
      availableAddons:[
        Addon(name: "Extra lemon", price: 0.99),
        Addon(name: "Cabbage", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Classic bowl",
      description: "A classic bowl with sauce and vegetables definetly improve your day.",
      imagePath:"lib/images/food/salads/загруженное.jpg",
      price:0.99,
      category:FoodCategory.salads,
      availableAddons:[
        Addon(name: "Garlic", price: 0.99),
        Addon(name: "Mozarella", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    //sides
    Food(
      name: "Mixed sides",
      description: "A juicy side that will improve your mood and gain your energy.",
      imagePath:"lib/images/food/sides/item4.jpg",
      price:0.99,
      category:FoodCategory.sides,
      availableAddons:[
        Addon(name: "Extra sauce", price: 0.99),
        Addon(name: "Extra beer", price: 1.99),
      ],
    ),
    Food(
      name: "Classic side",
      description: "Classic side that make you feel satisfied with your meal.",
      imagePath:"lib/images/food/sides/item5.jpg",
      price:0.99,
      category:FoodCategory.sides,
      availableAddons:[
        Addon(name: "Extra sauce", price: 0.99),
        Addon(name: "Extra beer", price: 1.99),
      ],
    ),
    Food(
      name: "Parmesan Roasted Carrot Fries",
      description: "Parmesan Roasted Carrot Fries with sauce.",
      imagePath:"lib/images/food/sides/Parmesan Roasted Carrot Fries Recipe.jpg",
      price:0.99,
      category:FoodCategory.sides,
      availableAddons:[
        Addon(name: "Extra sauce", price: 0.99),
        Addon(name: "Extra beer", price: 1.99),
      ],
    ),
    Food(
      name: "Poke bowl",
      description: "Poke bowl with harmonic combination of food.",
      imagePath:"lib/images/food/sides/poke bowl.jpg",
      price:0.99,
      category:FoodCategory.sides,
      availableAddons:[
        Addon(name: "Extra sauce", price: 0.99),
        Addon(name: "Extra beer", price: 1.99),
      ],
    ),
    Food(
      name: "Healthy bowl",
      description: "Super healthy bowl with vegetables and seeds.",
      imagePath:"lib/images/food/sides/Salty food.jpg",
      price:0.99,
      category:FoodCategory.sides,
      availableAddons:[
        Addon(name: "Extra sauce", price: 0.99),
        Addon(name: "Extra beer", price: 1.99),
      ],
    ),
    //desserts
    Food(
        name: "Tiramisu",
        description: "Chocolate tiramisu.",
        imagePath:"lib/images/food/desserts/Easy Chocolate Tiramisu Ready in 20 Minutes.jpg",
        price:0.99,
        category:FoodCategory.desserts,
        availableAddons: [
          Addon(name: "Extra powder", price: 0.99),
        ]
    ),
    Food(
      name: "Glazed donut",
      description: "A glazed donut with favouring smell of new bread.",
      imagePath:"lib/images/food/desserts/bulochka1.jpg",
      price:0.99,
      category:FoodCategory.desserts,
      availableAddons:[
        Addon(name: "Extra glaze", price: 0.99),
      ],
    ),
    Food(
      name: "Classic cheesecake",
      description: "A classic cheesecake perfectly fit with cup of tea.",
      imagePath:"lib/images/food/desserts/cheesecake.jpg",
      price:0.99,
      category:FoodCategory.desserts,
      availableAddons:[
        Addon(name: "Extra berries", price: 0.99),
      ],
    ),
    Food(
      name: "Donut",
      description: "Wanna try new trend and eat this donut? Here u are.",
      imagePath:"lib/images/food/desserts/donut.jpg",
      price:0.99,
      category:FoodCategory.desserts,
      availableAddons:[
        Addon(name: "Extra sprinkle", price: 0.99),
      ],
    ),
    Food(
      name: "Pie",
      description: "A cherry pie is cooked by our secret receipt that return u in childhood.",
      imagePath:"lib/images/food/desserts/pie.jpg",
      price:0.99,
      category:FoodCategory.desserts,
      availableAddons:[
        Addon(name: "Extra berries", price: 0.99),
      ],
    ),
    //drinks
    Food(
      name: "Lemonade with lemon and lime",
      description: "A perfect option for hot weather.",
      imagePath:"lib/images/food/drinks/fdrink.jpg",
      price:0.99,
      category:FoodCategory.drinks,
      availableAddons:[
        Addon(name: "Extra ice", price: 0.99),
      ],
    ),
    Food(
      name: "Strawberry lemonade with basilic",
      description: ".",
      imagePath:"lib/images/food/drinks/fidrink.jpg",
      price:0.99,
      category:FoodCategory.drinks,
      availableAddons:[
        Addon(name: "Extra ice", price: 0.99),

      ],
    ),
    Food(
      name: "Double portion of strawberry lemonade with mint",
      description: "Wanna cool down? Try this lemonade.",
      imagePath:"lib/images/food/drinks/foudrink.jpg",
      price:0.99,
      category:FoodCategory.drinks,
      availableAddons:[
        Addon(name: "Extra ice", price: 0.99),
      ],
    ),
    Food(
      name: "Orange juice",
      description: "Orange juice gives u a vitamin C in any weather outside.",
      imagePath:"lib/images/food/drinks/sdrink.jpg",
      price:0.99,
      category:FoodCategory.drinks,
      availableAddons:[
        Addon(name: "Extra ice", price: 0.99),
      ],
    ),
    Food(
      name: "Blueberry lemonade",
      description: "A delicious lemonade with berries that make u feel like u in a Bali on holiday.",
      imagePath:"lib/images/food/drinks/pdrink.jpg",
      price:0.99,
      category:FoodCategory.drinks,
      availableAddons:[
        Addon(name: "Extra ice", price: 0.99),
      ],
    ),
  ];
//user cart
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;

  // Методы для работы с корзиной остаются без изменений
  void addToCart(Food food, List<Addon> selectedAddons) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(
        food: food,
        selectedAddons: selectedAddons,
      ));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt.");
    receipt.writeln();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice((getTotalPrice()))}");

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  String _formatAddons(List<Addon> addons) {
    return addons.map((addon) => "${addon.name}(${_formatPrice(addon.price)})").join(",");
  }
}