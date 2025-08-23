import 'package:flutter/material.dart';
import 'package:redturant_app/futcher/ui/model/food_item.dart';
import 'package:redturant_app/futcher/ui/widgets/catogry_filter.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_search_bar.dart';
import 'package:redturant_app/futcher/ui/widgets/food_card.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key}); 
 
 final List <FoodItem> fooditem = [ 
  FoodItem(
    imageUrl: 'assets/images/image 6.png', 
    name: 'Cheeseburger', 
    description: 'Wendy Burger', 
    rating: 4.9 , 
    ) ,  

    FoodItem(
    imageUrl: 'assets/images/image 6.png', 
    name: 'Cheeseburger', 
    description: 'Wendy Burger', 
    rating: 4.9 , 
    ) , 

    FoodItem(
    imageUrl: 'assets/images/image 6.png', 
    name: 'Cheeseburger', 
    description: 'Wendy Burger', 
    rating: 4.9 , 
    ) , 

    FoodItem(
    imageUrl: 'assets/images/image 6.png', 
    name: 'Cheeseburger', 
    description: 'Wendy Burger', 
    rating: 4.9 , 
    ) ,
 ] ;
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          
          children: [ 
           SizedBox(height: 50,) ,  
           CustomSearchBar(
            controller: TextEditingController(),
          ) ,  

          SizedBox(height: 20,) ,

          CategoryFilter(), 

          SizedBox(height: 50,) , 

           Expanded(
             child: GridView.builder(
              itemCount: fooditem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 , 
                crossAxisSpacing: 10 , 
                childAspectRatio: 0.75 ,
                mainAxisSpacing: 15.0,
              ),
             
              itemBuilder: (context, index) {
                final item = fooditem[index] ; 
                return FoodCard(
                  foodItem: item, 
                  onCardTap: () {
                    print("${item.name}") ;
                  }, 
             
                  onFavoriteTap: () {
                    print(item.description);
                  },
                ); 
              },
             ),
           ) , 
            
          ],
        ),
      ),
    );
  }
}