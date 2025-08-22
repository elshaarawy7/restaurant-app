import 'package:flutter/material.dart';
import 'package:redturant_app/futcher/ui/pages/spalsh_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpalshPage(),
    );
  }
}
