import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_item.dart';
import '../models/restaurant.dart';
import 'my_quantity_selector.dart';
//Это виджет Flutter, который отображает элемент корзины покупок в приложении для ресторана
class MyCartTile extends StatelessWidget {
  final CartItem cartItem; //принимаем элемент корзины
  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
        builder:(context,restaurant,_)=> Container(
          //restaurant - экземпляр вашего Restaurant (данные, которые предоставляет провайдер)
          //child - неиспользуемый в этом случае параметр (может использоваться для оптимизации)
          //При любом изменении в Restaurant (например, при вызове addToCart/removeFromCart)
          // Весь Container и его дочерние виджеты будут перестроены
          //При изменении количества товара (кнопки +/-)
          // При изменении состава добавок
          // При любом другом изменении в Restaurant, которое уведомляет слушателей
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            //borderRadius: BorderRadius.circular(8), нет смысла в этом
          ),
          margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //food image
                      ClipRRect(//обрезаем ассет , BoxDecoration- альтернатива
                        borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,//чтобы картинка точь-в-точь подошла по параметрам
                      ),
                      ),
                    const SizedBox(width:30 ,),
                    //name and price
                    Expanded( //поскольку не все название помещалось
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //food name
                          Text(cartItem.food.name),
                          //food price
                          Text(
                            '\$${cartItem.food.price}',
                            style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),

                    //increment or decrement quantity
                    QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onDecrement: (){
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement: (){
                          restaurant.addToCart(
                              cartItem.food, cartItem.selectedAddons);
                        },
                    )
                  ],
                ),
              ),
              //addons
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left:10, bottom: 10, right: 10),
                  children: cartItem.selectedAddons
                      .map((addon)=>Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                        label: Row(
                          children: [
                            //addon name
                            Text(addon.name),

                            //adon price
                            Text(' (\$${addon.price})'),
                          ],
                        ),
                        shape: StadiumBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary)),

                        onSelected: (value){},
                                            backgroundColor: Theme.of(context).colorScheme.secondary,
                                            labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontSize: 12,
                                            ),
                                          ),
                      ),
                  )
                      .toList(),
                ),
              )

              //addons
            ],
          ),
        ),
    );
  }
}
