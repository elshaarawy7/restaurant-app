import 'package:flutter/material.dart';

class SpalshPage extends StatelessWidget {
  const SpalshPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        "assets/images/Splash Page_02 (1).png",

        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        alignment: Alignment.center,
      ),
    );
  }
}
