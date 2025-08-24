import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redturant_app/futcher/logic/model/meel_model.dart';

class ApiService {
  // [!] تعديل: استخدام الرابط الصحيح
  final String _apiUrl = 'https://fakerestaurantapi.runasp.net/api/Restaurant/items';

  Future<List<Meal>> getMeals( ) async {
    final response = await http.get(Uri.parse(_apiUrl ));

    if (response.statusCode == 200) {
      // بما أن الـ API يعيد قائمة وجبات مباشرة، فالعملية بسيطة
      final List<dynamic> jsonList = jsonDecode(response.body);
      
      // قم بتحويل كل عنصر في القائمة إلى كائن Meal باستخدام الموديل المحدث
      return jsonList.map((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals. Status code: ${response.statusCode}');
    }
  }
}




