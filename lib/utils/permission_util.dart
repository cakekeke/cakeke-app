import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  static List<Permission> storagePermissions = <Permission>[Permission.storage];
  static List<Permission> locationPermissions = <Permission>[
    Permission.location
  ];

  static Future<Map<Permission, PermissionStatus>> requestStorage() async {
    if (Platform.isIOS) {
      return await storagePermissions.request();
    }
    return await storagePermissions.request();
  }

  static Future<Map<Permission, PermissionStatus>> requestLocation() async {
    return await locationPermissions.request();
  }

  static Future<PermissionStatus> allowedLocationPermission() async {
    return await Permission.location.status;
  }
}
