import 'package:cakeke/config/api_config.dart';
import 'package:cakeke/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await NaverMapSdk.instance.initialize(clientId: naverMapClientId);

  runApp(const App());
}
