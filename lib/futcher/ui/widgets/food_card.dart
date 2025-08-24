import 'package:flutter/material.dart';

class FoodCard extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String description;
  final double price; // سنستخدم السعر الآن
  final VoidCallback onFavoriteTap;
  final VoidCallback onCardTap;

  const FoodCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price, // تم التغيير من rating إلى price
    required this.onFavoriteTap,
    required this.onCardTap,
  }) : super(key: key);

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool isFavorat = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onCardTap,
      child: Container(
        // --- [1] إضافة الظل والحواف الدائرية ---
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        // --- [2] استخدام ClipRRect لجعل الصورة تأخذ نفس الحواف الدائرية ---
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- [3] تعديل الصورة ---
              Expanded(
                flex: 3, // إعطاء مساحة أكبر للصورة
                child: SizedBox(
                  width: double.infinity, // اجعل الصورة تملأ العرض
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover, // [!] أهم تعديل: اجعل الصورة تملأ المساحة مع قص الأجزاء الزائدة
                    // في حالة كان رابط الصورة فارغاً
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.fastfood, size: 40, color: Colors.grey);
                    },
                    // عرض مؤشر تحميل لكل صورة على حدة
                    loadingBuilder: (context, child, progress) {
                      return progress == null ? child : const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              // --- [4] إضافة هوامش داخلية للنصوص ---
              Expanded(
                flex: 2, // إعطاء مساحة أقل للنصوص
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround, // توزيع المسافات
                    children: [
                      // --- [5] تنسيق النصوص ---
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // --- [6] تنسيق السعر وزر المفضلة ---
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${widget.price.toStringAsFixed(2)}', // عرض السعر مع علامة الدولار
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.deepOrange, // لون مميز للسعر
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              setState(() {
                                isFavorat = !isFavorat ;
                              });
                            },
                            borderRadius: BorderRadius.circular(20),
                            child:  Icon(
                               isFavorat ? Icons.favorite  : Icons.favorite_border,
                              color:isFavorat? Colors.red : Colors.black54,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


