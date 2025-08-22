import 'package:flutter/material.dart';
import 'package:redturant_app/core/utils/app_router.dart';
import 'package:redturant_app/futcher/ui/pages/Onboarding_pages/Onboarding_1..dart';
import 'package:redturant_app/futcher/ui/pages/page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,

    );
  }
}
