import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redturant_app/core/utils/app_router.dart';

class CardDetiles extends StatefulWidget {
  const CardDetiles({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.onFavoriteTap,
    required this.onCardTap,
  });

  final String imageUrl;
  final String name;
  final String description;
  final double price; // سنستخدم السعر الآن
  final VoidCallback onFavoriteTap;
  final VoidCallback onCardTap;

  @override
  State<CardDetiles> createState() => _CardDetilesState();
}

class _CardDetilesState extends State<CardDetiles> {
  bool isFavourate = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.userData);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          height: 500,
          width: 500,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.broken_image,
                          size: 50,
                          color: Colors.grey,
                        );
                      },
                    ),
                  ),
                ),

                Text(
                  widget.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 5),

                Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.price} \$",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          overflow: TextOverflow.ellipsis,
                        ),
                        softWrap: true,
                      ),

                      IconButton(
                        onPressed: () {
                          setState(() {
                            isFavourate = !isFavourate;
                          });
                        },

                        icon: Icon(
                          isFavourate ? Icons.favorite : Icons.favorite_border,
                          color: isFavourate ? Colors.red : Colors.black,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
