import 'package:permission_handler/permission_handler.dart';

Future<bool> requestNotificationPermission() async {
  if (const String.fromEnvironment("DRIVING_BUDDY_DEVICE_TYPE").isNotEmpty) {
    return true;
  }
  final permission = await Permission.notification.request();
  return permission.isGranted;
}
