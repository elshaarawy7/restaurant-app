import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CreousSileder extends StatelessWidget {
   CreousSileder({super.key}); 

   final List<String> food_card = [
    "assets/card_food/Black White Simple Opening Banner.png",
    "assets/card_food/Blue & Yellow Minimalist Fast Food Banner Promotion.png",
    "assets/card_food/Brown and Colorful Simple Delicious Food Menu Banner.png",
    "assets/card_food/Red Yellow Creative Minimalist Restaurant Banner Horizontal.png",
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
              itemCount: food_card.length, // عدد الصور أو العناصر
              itemBuilder: (context, index, realIndex) {
                return Image.asset(
                  food_card[index], // كل عنصر من اللستة items
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                height: 170, // ارتفاع الكاروسيل
                aspectRatio: 1, // نسبة العرض للارتفاع
                viewportFraction:
                    0.8, // يخلي الكارد الأساسي كبير والباقي صغيرين
                autoPlay: true, // تشغيل تلقائي
                autoPlayInterval: Duration(seconds: 3), // مدة الانتقال
                autoPlayAnimationDuration: Duration(
                  seconds: 3,
                ), // وقت الانيميشن نفسه
                autoPlayCurve:
                    Curves.linear, // نوع الحركة (ممكن تغيرها زي easeInOut)
                enlargeCenterPage: true, // يكبر العنصر اللي في النص
              ),
            );
  }
}