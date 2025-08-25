import 'package:flutter/material.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_batton.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_text_field.dart';

class DataUser extends StatelessWidget {
  const DataUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 50),

          CustomTextField(
            controller: TextEditingController(),
            hintText: 'please Enter your name',
            labelText: 'Name',
          ),

          SizedBox(height: 20),

          CustomTextField(
            controller: TextEditingController(),
            hintText: 'enter your city',
            labelText: 'city',
          ),

          SizedBox(height: 20),

          CustomTextField(
            controller: TextEditingController(),
            hintText: 'enter your streat',
            labelText: 'streat ',
          ),  

          SizedBox(height: 20,) , 

          CustomTextField(
            controller: TextEditingController(),
            hintText: 'enter your number',
            labelText: 'number ',
            isNumeric: true,
          ),  

          SizedBox(height: 20,) , 
          CustomButton(
            text: "Confirm Order" ,
            onPressed: () {
              
            },
          ) ,
        ],
      ),
    );
  }
}
