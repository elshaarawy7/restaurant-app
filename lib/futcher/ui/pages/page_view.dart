import 'package:flutter/material.dart';
import 'package:redturant_app/futcher/ui/pages/Onboarding_pages/Onboarding_1..dart';
import 'package:redturant_app/futcher/ui/pages/Onboarding_pages/Onboarding_2.dart';
import 'package:redturant_app/futcher/ui/pages/Onboarding_pages/Onboarding_3.dart';
import 'package:redturant_app/futcher/ui/pages/Onboarding_pages/Onboarding_4.dart';
import 'package:redturant_app/futcher/ui/pages/home_page_detiles.dart';
import 'package:redturant_app/futcher/ui/pages/singin.dart';

class Page_View extends StatefulWidget {
  const Page_View({super.key});

  @override
  State<Page_View> createState() => _Page_ViewState();
}

class _Page_ViewState extends State<Page_View> { 
  final PageController controller = PageController();

  int current_page = 0; // تصحيح الإملاء
  List<Widget> screens = [
    Onboarding_1(),
    Onboarding2(), // تصحيح الاسم
    Onboarding3(),
    Onboarding4(), 
    Singin(),
    HomePageDetiles() ,
    
  ];

  void next_page() {
    if (current_page < screens.length - 1) {
      controller.nextPage(
        duration: Duration(microseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: PageView.builder( // تصحيح الإملاء
        controller: controller,
        itemCount: screens.length,
        onPageChanged: (index) {
          setState(() {
            current_page = index; // تحديث الصفحة الحالية
          });
        },
        itemBuilder: (context, index) {
          return screens[index];
        },
      ),
    );
  }
}