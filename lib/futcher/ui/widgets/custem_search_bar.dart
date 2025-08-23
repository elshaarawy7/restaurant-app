import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    this.hintText = 'Search',
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
    
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 24,
        ),
        filled: true,
        fillColor: Color(0XFFFFFFFF),
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20), // السمك
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // زوايا دائرية جداً
          borderSide: BorderSide(), // بدون حدود خارجية
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(), 
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(), 
        ),
      ),
    );
  }
}
