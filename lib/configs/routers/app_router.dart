import 'package:flutter/material.dart';
import 'package:my_home_doctor/modules/signin_signup/presentation/ui/signin_signup_page.dart';
import 'app_name_routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case AppNameRoutes.SIGNIN_SIGNUP:
        dynamic args = route.arguments;
        return MaterialPageRoute(
          builder: (_) => SignInSignUpPage(),
        );
      // case AppNameRoutes.FIRST_SCAN_RESULT:
      //   dynamic args = route.arguments;
      //   return MaterialPageRoute(
      //     builder: (_) => const FirstScanResultPage(),
      //   );
      // case AppNameRoutes.SCAN_CONTACT_SUCCESS:
      //   dynamic args = route.arguments;
      //   return MaterialPageRoute(
      //     builder: (_) => ScanContactSuccessPage(
      //       pathImage: args != null ? args["pathImage"] : null,
      //       cardInfo: args != null ? args["cardInfo"] : null,
      //       langCode: args != null ? args["langCode"] : null,
      //     ),
      //   );

      default:
        dynamic args = route.arguments;
        return MaterialPageRoute(
          builder: (_) => SignInSignUpPage(),
        );
    }
  }
}
