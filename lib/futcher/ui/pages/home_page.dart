import 'package:flutter/material.dart';
import 'package:redturant_app/core/utils/api_servies.dart';
import 'package:redturant_app/futcher/logic/model/meel_model.dart';
import 'package:redturant_app/futcher/ui/widgets/catogry_filter.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_search_bar.dart';
import 'package:redturant_app/futcher/ui/widgets/food_card.dart';
// ... باقي استيراداتك

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;
  
  List<Meal> _allMeals = [];
  List<Meal> _filteredMeals = [];

  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  Future<void> _fetchMeals() async {
    try {
      final meals = await _apiService.getMeals();
      setState(() {
        _allMeals = meals;
        _filteredMeals = meals;
        _isLoading = false;
      });
    } catch (e) { /* ... */ }
  }

  // دالة الفلترة الصحيحة
  void _filterMeals(String query) {
    final lowerCaseQuery = query.toLowerCase();
    setState(() {
      _filteredMeals = _allMeals.where((meal) {
        final mealName = meal.name.toLowerCase();
        return mealName.contains(lowerCaseQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            
            // [!] الاستدعاء الصحيح لـ CustomSearchBar
            CustomSearchBar(
              hintText: 'Search for food...',
              onChanged: (query) {
                _filterMeals(query); // <-- استدعاء دالة الفلترة
                
              }, 
            ),

            const SizedBox(height: 20),
            CategoryFilter(),
            const SizedBox(height: 50),
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredMeals.isEmpty
                      ? const Center(child: Text('No matching meals found.'))
                      : GridView.builder(
                          itemCount: _filteredMeals.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 15.0,
                          ),
                          itemBuilder: (context, index) {
                            final meal = _filteredMeals[index];
                            return FoodCard(
                              imageUrl: meal.imageUrl,
                              name: meal.name,
                              description: meal.description,
                              price: meal.price,
                              onCardTap: () {},
                              onFavoriteTap: () {},
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

