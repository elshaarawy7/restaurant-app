import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redturant_app/core/utils/Function/meal_functions.dart';
import 'package:redturant_app/core/utils/api_servies.dart';
import 'package:redturant_app/core/utils/app_router.dart';
import 'package:redturant_app/futcher/logic/model/meel_model.dart';
import 'package:redturant_app/futcher/ui/widgets/catogry_filter.dart';
import 'package:redturant_app/futcher/ui/widgets/custem_search_bar.dart';
import 'package:redturant_app/futcher/ui/widgets/food_card.dart';

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

void _filterMeals(String query) {
  setState(() {
    _filteredMeals = filterMeals(_allMeals, query);
  });
}


  

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            
            // [!] الاستدعاء الصحيح لـ CustomSearchBar
            CustomSearchBar(
              hintText: 'Search for food...',
              onChanged: (query) {
                _filterMeals(query); // <-- استدعاء دالة الفلترة
                
              }, 
            ),
// 
            const SizedBox(height: 20),
            CategoryFilter(), 
            SizedBox(height: 20,) , 

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [ 
                Text("Manus" , style: TextStyle(
                  color: Colors.black , 
                  fontSize: 20 , 
                  fontWeight: FontWeight.bold , 
                ),), 

                IconButton(
                  onPressed: (){
                    GoRouter.of(context).push(AppRouter.home_page_details) ;
                  },
                  icon: Icon(Icons.arrow_back_ios , color: Colors.black , size: 20,),
                ) , 
              ],
            ) , 


            const SizedBox(height: 20),
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

