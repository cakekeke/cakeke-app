import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static List<Permission> androidPermissions = <Permission>[Permission.storage];

  static List<Permission> iosPermissions = <Permission>[Permission.storage];

  static Future<Map<Permission, PermissionStatus>> requestAll() async {
    if (Platform.isIOS) {
      return await iosPermissions.request();
    }
    return await androidPermissions.request();
  }
}
