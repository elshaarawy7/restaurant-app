import 'package:flutter/material.dart';
import 'package:redturant_app/core/utils/app_color.dart';

class Singin extends StatelessWidget {
  const Singin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.signinColor , 
      body: Center(
        child: Column(
          
          children: [
            SizedBox(height: 100,) , 
            Text("Sing Up" , style: TextStyle(
              color: Colors.white , 
              fontSize: 35 , 
              fontWeight: FontWeight.bold , 
            ),) ,  

            SizedBox(height: 20,) , 

            Text("please sing in to be started" , style: TextStyle(
              color: Colors.white , 
              fontSize: 20 , 
              fontWeight: FontWeight.w500 , 
            ),) , 

          
          ],
        ),
      ),
    );
  }
}