import 'package:go_router/go_router.dart';
import 'package:redturant_app/futcher/ui/pages/logup.dart';

class AppRouter {
  static const logup = '/Logup' ;
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: logup , 
        builder: (context, state) => Logup(),
      )
    ]
  );
}