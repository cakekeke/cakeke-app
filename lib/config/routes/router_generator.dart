import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/view/pages/landing_page.dart';
import 'package:cakeke/view/pages/main_page.dart';
import 'package:cakeke/view/pages/review_page.dart';
import 'package:cakeke/view/pages/sign_in_page.dart';
import 'package:cakeke/view/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => const LandingPage());
      case Routes.signIn:
        return MaterialPageRoute<dynamic>(builder: (_) => SiginInPage());
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(builder: (_) => SiginUpPage());
      case Routes.main:
        return MaterialPageRoute<dynamic>(builder: (_) => const MainPage());
      case Routes.review:
        return MaterialPageRoute<dynamic>(builder: (_) => const ReviewPage());
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => const LandingPage());
    }
  }
}
