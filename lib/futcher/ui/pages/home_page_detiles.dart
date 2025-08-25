import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:redturant_app/futcher/ui/widgets/creous_sileder.dart';

class HomePageDetiles extends StatelessWidget {
  HomePageDetiles({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            child:CreousSileder() ,
          ),
        ],
      ),
    );
  }
}
