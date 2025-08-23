import 'package:flutter/material.dart';
import 'package:redturant_app/futcher/ui/widgets/catogry_filter.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            
          ],
        ),
      ),
    );
  }
}