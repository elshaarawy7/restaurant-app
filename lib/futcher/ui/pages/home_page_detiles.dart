import 'package:flutter/material.dart';
import 'package:redturant_app/core/utils/Function/meal_functions.dart';
import 'package:redturant_app/core/utils/api_servies.dart';
import 'package:redturant_app/futcher/logic/model/meel_model.dart';
import 'package:redturant_app/futcher/ui/widgets/creous_sileder.dart';

class HomePageDetiles extends StatefulWidget {
  HomePageDetiles({super.key});

  @override
  State<HomePageDetiles> createState() => _HomePageDetilesState();
}

class _HomePageDetilesState extends State<HomePageDetiles> {
  final ApiService _apiService = ApiService();
  bool _isLoading = true;

  List<Meal> _allMeals = [];
  List<Meal> _filteredMeals = [];
  final List<Meal> cartItem = [];

  @override
  void initState() {
    super.initState();
    _fetchMeals();
  }

  void _addToCart(Meal meal) {
    setState(() {
      if (cartItem.contains(meal)) {
        cartItem.remove(meal);
      } else {
        cartItem.add(meal);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${meal.name} added to cart!'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  Future<void> _fetchMeals() async {
    try {
      final meals = await fetchMeals();
      setState(() {
        _allMeals = meals;
        _filteredMeals = meals;
        _isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  double get _totalPrice {
    return cartItem.fold(0, (total, cuurent) => total + cuurent.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: SizedBox(height: 200, child: CreousSileder()),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 20)),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "The Best Manue ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 10)),

          _isLoading
              ? SliverFillRemaining(child: CircularProgressIndicator())
              : SliverList(
                  delegate: SliverChildListDelegate([
                    buildCarouselSlider(_allMeals),
                    const SizedBox(height: 20),
                    buildCarouselSlider(_allMeals),
                    const SizedBox(height: 20), 
                    buildCarouselSlider(_allMeals),
                  ]),
                ),

          SliverToBoxAdapter(child: SizedBox(height: 20)),

         
        ],
      ),
    );
  } 

 

} 


