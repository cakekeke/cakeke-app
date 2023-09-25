import 'package:cakeke/routes/routes.dart';
import 'package:cakeke/ui/pages/home_page.dart';
import 'package:cakeke/ui/pages/landing_page.dart';
import 'package:cakeke/ui/pages/sign_in_page.dart';
import 'package:cakeke/ui/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => const LandingPage());
      case Routes.home:
        return MaterialPageRoute<dynamic>(builder: (_) => const HomePage());
      case Routes.signIn:
        return MaterialPageRoute<dynamic>(builder: (_) => const SiginInPage());
      case Routes.signUp:
        return MaterialPageRoute<dynamic>(builder: (_) => const SiginUpPage());
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => const LandingPage());
    }
  }
}
