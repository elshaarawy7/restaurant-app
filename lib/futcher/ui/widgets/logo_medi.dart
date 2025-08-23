import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class LogoMedi extends StatelessWidget {
  const LogoMedi({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100) , 
                              
                            ), 
                            child: Icon(
                              Ionicons.logo_facebook , 
                              color: Colors.blue, 
                              size: 50,
                            ),
                          ),  
      
                          Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100) , 
                        ), 
                        child: Icon(
                          Ionicons.logo_twitter , 
                          color: Colors.blue, 
                          size: 50,
                        ),
                      ) ,  
      
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100) , 
                        ), 
                        child: Icon(
                          Ionicons.logo_apple , 
                          color: Colors.black, 
                          size: 50,
                        ),
                      ) , 
                          
                        ],
                      ),
    );
  }
}