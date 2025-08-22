import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final VoidCallback? onSuffixIconTap;

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText.toUpperCase(),
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400]),
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              suffixIcon: suffixIcon != null
                  ? IconButton(
                      icon: Icon(suffixIcon, color: Colors.grey[500]),
                      onPressed: onSuffixIconTap,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
