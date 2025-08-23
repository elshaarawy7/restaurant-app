import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redturant_app/futcher/logic/model/meel_model.dart';

class ApiServies {
  static const String _baseUrl = 'https://fakerestaurantapi.runasp.net/api/' ; 


  
// جلب الوجبات
  Future<List<Meal>> getMeals( ) async {
    final response = await http.get(Uri.parse("${_baseUrl} Meal")) ;

    if(response.statusCode == 200){
      final List <dynamic> JsonList = jsonDecode(response.body); 

      return JsonList.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals from API');
    }
    
  }
}