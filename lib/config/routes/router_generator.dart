import 'package:cakeke/config/routes/routes.dart';
import 'package:cakeke/data/arguments/review.dart';
import 'package:cakeke/data/arguments/storeDetail.dart';
import 'package:cakeke/data/arguments/webView.dart';
import 'package:cakeke/view/pages/landing_page.dart';
import 'package:cakeke/view/pages/like_page.dart';
import 'package:cakeke/view/pages/main_page.dart';
import 'package:cakeke/view/pages/review_page.dart';
import 'package:cakeke/view/pages/sign_in_page.dart';
import 'package:cakeke/view/pages/sign_up_page.dart';
import 'package:cakeke/view/pages/store_detail_page.dart';
import 'package:cakeke/view/pages/web_view_page.dart';
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
      case Routes.storeDetail:
        return MaterialPageRoute<dynamic>(
            builder: (_) => StoreDetailPage(
                  store:
                      (settings.arguments as StoreDetailScreenArguments).store,
                ));
      case Routes.review:
        return MaterialPageRoute<dynamic>(
            builder: (_) => ReviewPage(
                storeId:
                    (settings.arguments as ReviewScreenArguments).storeId));
      case Routes.likeStore:
        return MaterialPageRoute<dynamic>(builder: (_) => const LikePage());
      case Routes.webView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => WebViewPage(
              url: (settings.arguments as WebViewScreenArguments).url,
              title: (settings.arguments as WebViewScreenArguments).title),
        );
      default:
        return MaterialPageRoute<dynamic>(builder: (_) => const LandingPage());
    }
  }
}
