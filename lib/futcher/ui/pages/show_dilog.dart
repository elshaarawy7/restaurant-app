import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redturant_app/core/utils/app_router.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_batton.dart';


void showSuccessDialog(BuildContext context){

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12) ,
        ), 
        
        content: Container(
          height: 350, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red , // لون خلفية الأيقونة
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.red.shade400, width: 2),
                ),
                child: Icon(
                  Icons.check , color: Colors.white,  size: 50,
                  
                ),
                ) ,  


                SizedBox(height: 24,) , 

                const Text(
                'Success!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ), 

              SizedBox(height: 12,) , 

                Text(
                'Your payment was successful.\nA receipt has been sent to your email.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),


              SizedBox(height: 32,) , 

              SizedBox(
                height: 50, 
                width: double.infinity, 
                child: CustomButton(
                  text: 'Go back', 
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.home_page_details) ;
                  },
                ),
              )
                
            ],
          ),
        ),
      );
    },
  );
}