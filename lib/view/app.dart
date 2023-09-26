import 'package:cakeke/config/routes/router_generator.dart';
import 'package:cakeke/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // todo: bloc 로직 추가하면 제거
  @override
  void didChangeDependencies() async {
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // todo: bloc provider를 주입하여 토큰 여부에 따라 라우팅
    return const MaterialApp(
      title: 'Cakeke',
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: true ? Routes.home : Routes.landing,
    );
  }
}
