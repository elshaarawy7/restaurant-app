import 'package:go_router/go_router.dart';
import 'package:redturant_app/futcher/ui/pages/logup.dart';
import 'package:redturant_app/futcher/ui/pages/page_view.dart';
import 'package:redturant_app/futcher/ui/pages/singin.dart';

class AppRouter {
  static const pageView  = '/';
  static const logup = '/Logup' ;
  static const singin = '/Singin' ;
  static final router = GoRouter(
    routes: [ 

      GoRoute(
        path: pageView , 
        builder: (context, state) => Page_View(),
      ),

      GoRoute(
        path: logup , 
        builder: (context, state) => Logup(),
      ) , 

      GoRoute(
        path: singin , 
        builder: (context, state) => Singin(),
      )
    ]
  );
}