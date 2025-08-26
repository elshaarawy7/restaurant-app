import 'package:go_router/go_router.dart';
import 'package:redturant_app/futcher/ui/pages/data_user.dart';
import 'package:redturant_app/futcher/ui/pages/home_page.dart';
import 'package:redturant_app/futcher/ui/pages/home_page_detiles.dart';
import 'package:redturant_app/futcher/ui/pages/page_view.dart';
import 'package:redturant_app/futcher/ui/pages/payment_page.dart';


class AppRouter {
  static const pageView = '/';
  static const homepage = '/homepage';
  static const home_page_details = '/home_page_details' ;
  static const userData = '/userData' ;
  static const pymantPage = '/pymantPage' ;


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: pageView,
        builder: (context, state) => Page_View(),
      ),
      
      GoRoute(
        path: homepage,
        builder: (context, state) => HomePage(),
      ), 

      GoRoute(
        path: home_page_details , 
        builder: (context, state) => HomePageDetiles(),
      ) ,  

      GoRoute(
        path: userData , 
        builder: (context, state) => DataUser(),
      ) , 

      GoRoute(
        path: pymantPage , 
        builder: (context, state) => PaymentPage(),
      )
      
    ],
  );
}
