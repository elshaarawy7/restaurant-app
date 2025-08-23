class Meal {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final int restaurantId;
  final String category;

  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.restaurantId,
    required this.category,
  }); 


  factory Meal.fromJson(Map<String , dynamic> json){
    return Meal(
       id: json['id'],
      name: json['name'],
      description: json['description'],
      // التأكد من أن السعر هو double
      price: (json['price'] as num).toDouble(),
      imageUrl: json['imageUrl'],
      restaurantId: json['restaurantId'],
      category: json['category'],
    );
  }

}