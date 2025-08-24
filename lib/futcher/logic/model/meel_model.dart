class Meal {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Meal({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

  // [!] تعديل: تم تحديث أسماء الحقول لتطابق الـ API الأخير
  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['itemID'] ?? 0, // <--- تم التعديل
      name: json['itemName'] ?? 'no name', // <--- تم التعديل
      description: json['itemDescription'] ?? 'No Description', // <--- تم التعديل
      price: (json['itemPrice'] as num? ?? 0.0).toDouble(), // <--- تم التعديل
      imageUrl: json['imageUrl'] ?? ' ',
      category: json['category'] ?? '',
    );
  }
}

