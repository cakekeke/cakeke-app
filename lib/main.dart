import 'package:cakeke/config/api_config.dart';
import 'package:cakeke/data/source/local/prefs.dart';
import 'package:cakeke/view/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load(fileName: 'assets/config/.env');
  await NaverMapSdk.instance.initialize(clientId: naverMapClientId);
  await Prefs.init();

  runApp(const App());
}
