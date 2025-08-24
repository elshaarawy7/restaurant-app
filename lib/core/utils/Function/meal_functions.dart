

import 'package:redturant_app/core/utils/api_servies.dart';
import 'package:redturant_app/futcher/logic/model/meel_model.dart';

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
