import 'package:flutter/material.dart';
import 'package:redturant_app/core/utils/app_color.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_text_field.dart';

class Singin extends StatelessWidget {
  const Singin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.signinColor , 
      body: SingleChildScrollView(
        child: Center(
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
                
              SizedBox(height: 20,) ,
                
                Container(
                  height: 800 , 
                  width: double.infinity, 
                  decoration: BoxDecoration(
                  color: Colors.white, 
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15) , 
                      topRight: Radius.circular(15) ,  
                    ) ,
                  ), 
                  child: Column(
                    children: [
                
                      SizedBox(height: 20,) , 
                      CustomTextField(
                        hintText: 'enter your name', 
                        controller: TextEditingController(),
                        labelText: 'Name', 
                        isPassword: false, 
                        suffixIcon: Icons.person,
                      ) ,  

                      SizedBox(height: 20,) , 
                
                      CustomTextField(
                        hintText: 'enter your email', 
                        controller: TextEditingController(),
                        labelText: 'email', 
                        isPassword: false, 
                        suffixIcon: Icons.email_outlined,
                      ) , 

                      SizedBox(height: 20,) , 

                      CustomTextField(
                        hintText: 'enter your password', 
                        controller: TextEditingController(),
                        labelText: 'passowrd', 
                        isPassword: true, 
                        suffixIcon: Icons.email_outlined,
                      ) ,
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}