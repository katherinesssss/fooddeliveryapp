import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_button.dart';
import 'package:provider/provider.dart';
//страница с картинкой, выбором добавок и добавлением в корзину
import '../models/food.dart';
import '../models/restaurant.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

   FoodPage({
    super.key,
    required this.food,
  }){
    //initialize selected addons to be
     for(Addon addon in food.availableAddons){
       selectedAddons[addon]=false;
     }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // Форматируем выбранные дополнения
    final currentlySelectedAddons = selectedAddons.entries
        .where((entry) => entry.value == true)
        .map((entry) => entry.key)
        .toList();

    // Добавляем в корзину
    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);

    // Закрываем страницу ПОСЛЕ успешного добавления
    Navigator.pop(context);

    // Опционально: показываем уведомление о добавлении
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${food.name} added in cart')),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      //scaffold UI
      Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(25),
                margin: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
                child:Expanded(
                    child: Image.asset(widget.food.imagePath)),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    //food name
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),

                    //food price
                    Text(
                      '\$${widget.food.price}',
                      style:  TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary),
                    ),

                    const SizedBox(height: 10,),

                    //food description
                    Text(widget.food.description,),

                    const SizedBox(height: 10,),

                    Divider(color: Theme.of(context).colorScheme.secondary,),

                    const SizedBox(height: 10,),
                    //addons
                    Text(
                      "Add-ons",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),


                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: widget.food.availableAddons.length,
                        itemBuilder: (context,index){
                          //get individual addon
                          Addon addon = widget.food.availableAddons[index];

                          //return check box UI
                          return CheckboxListTile(
                            title: Text(addon.name),
                            subtitle: Text(
                              '\$${addon.price}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                            value: widget.selectedAddons[addon],
                            onChanged: (bool? value){
                              setState(() {
                                widget.selectedAddons[addon] = value!;
                              });
                            },
                          );
                        },
                      ),
                    )
                  ],),
              ),

              //button->add to cart
              MyButton(
                 onTap:()=>addToCart(widget.food,widget.selectedAddons),
                text: "Add to cart",
              ),

              const SizedBox(height: 25,),
            ],
          ),
        ),
      ),
    ],

    );

  }
}
