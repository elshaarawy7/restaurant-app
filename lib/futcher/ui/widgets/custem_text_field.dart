import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData? suffixIcon;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final VoidCallback? onSuffixIconTap;
  final bool isNumeric; // ✅ جديد (هل الحقل يقبل أرقام فقط؟)

  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.onSuffixIconTap,
    this.isNumeric = false, // default false
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
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: controller,
            obscureText: isPassword,
            keyboardType: isNumeric ? TextInputType.number : keyboardType, // ✅ رقم أو نص
            inputFormatters: isNumeric
                ? [FilteringTextInputFormatter.digitsOnly] // ✅ أرقام فقط
                : [],
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

