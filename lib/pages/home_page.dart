import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_current_location.dart';
import 'package:fooddeliveryapp/components/my_description_box.dart';
import 'package:fooddeliveryapp/components/my_drawer.dart';
import 'package:fooddeliveryapp/components/my_food_tile.dart';
import 'package:fooddeliveryapp/components/my_sliver_app_bar.dart';
import 'package:fooddeliveryapp/components/my_tab_bar.dart';
import 'package:fooddeliveryapp/models/food.dart';
import 'package:provider/provider.dart';

import '../models/restaurant.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  //tab controller
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  // sort out and return a list of food items that belong to a specific category
  List<Food> _filterMenuByCategory(FoodCategory category,List<Food> fulMenu){
    return fulMenu.where((food)=>food.category==category).toList();
  }
  //return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fulMenu){
    return FoodCategory.values.map((category){

      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fulMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context,index) {
            //get individual food
          final food=categoryMenu[index];

          //return food tile UI
          return FoodTile(
              food: food,
              onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context)=>FoodPage(food: food),
              ),
              ),
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
          headerSliverBuilder: (context, innerBoxIsScrolled)=>[
            MySliverAppBar(
                title: MyTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  //my current location
                    const MyCurrentLocation(),

                    //description box
                    const MyDescriptionBox()
                ],
                ),
            ),
          ],
        body: Consumer<Restaurant>(
          builder: (context,restaurant,child)=>TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
