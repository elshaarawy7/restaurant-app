import 'package:flutter/material.dart';
import 'package:redturant_app/futcher/ui/widgets/card_detiles.dart';
import 'package:redturant_app/futcher/ui/widgets/creous_sileder.dart';

class HomePageDetiles extends StatelessWidget {
  HomePageDetiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SizedBox(height: 200, child: CreousSileder()),

            SizedBox(height: 20),

            Text(
              "The Best Manue ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), 

            CardDetiles() , 

           
          ],
        ),
      ),
    );
  }
}
