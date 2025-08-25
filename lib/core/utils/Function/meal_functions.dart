

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redturant_app/core/utils/api_servies.dart';
import 'package:redturant_app/core/utils/app_router.dart';
import 'package:redturant_app/futcher/logic/model/meel_model.dart';
import 'package:redturant_app/futcher/ui/widgets/card_detiles.dart';

final ApiService _apiService = ApiService();

Future<List<Meal>> fetchMeals() async {
  try {
    final meals = await _apiService.getMeals();
    return meals;
  } catch (e) {
    throw Exception("Error fetching meals: $e");
  }
}

List<Meal> filterMeals(List<Meal> allMeals, String query) {
  final lowerCaseQuery = query.toLowerCase();
  return allMeals.where((meal) {
    final mealName = meal.name.toLowerCase();
    return mealName.contains(lowerCaseQuery);
  }).toList();
} 

 Widget buildCarouselSlider(List<Meal> meals) {
    return CarouselSlider.builder(
      itemCount: meals.length,
      itemBuilder: (context, index, realIndex) {
        final meal = meals[index];
        // ملاحظة: أنت تمرر meal.imageUrl إلى name. قد يكون هذا خطأ.
        return CardDetiles(
          imageUrl: meal.imageUrl,
          name: meal.name, // <-- تم التعديل إلى meal.name
          description: meal.description,
          price: meal.price,
          onCardTap: () {},
          onFavoriteTap: () {

          },
        );
      },
      options: CarouselOptions(
        height: 200,
        viewportFraction: 0.4,
        enableInfiniteScroll: false, // من الأفضل إيقافها إذا كانت القائمة قصيرة
      ),
    );
  }

