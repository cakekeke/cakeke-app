import 'package:flutter_dotenv/flutter_dotenv.dart';

const baseUrl = 'http://43.202.0.192:8080/Cakeke';
String naverMapClientId = dotenv.env['NAVER_MAP_CLIENT_ID'] ?? "";
