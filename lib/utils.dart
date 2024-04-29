import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

Future<bool> requestNotificationPermission() async {
  if (const String.fromEnvironment("DRIVING_BUDDY_DEVICE_TYPE").isNotEmpty) {
    return true;
  }
  final permission = await Permission.notification.request();
  return permission.isGranted;
}

// courtesy of ChatGPT
List<String> formatDateTime(DateTime dateTime) {
  // Create a DateFormat for date and time separately
  final dateFormat = DateFormat("d MMM.");
  final timeFormat = DateFormat("h:mm a");

  // Format the DateTime object for date and time separately
  String formattedDate = dateFormat.format(dateTime);
  String formattedTime = timeFormat.format(dateTime);

  // Extract the day of the month
  int day = dateTime.day;

  // Add the suffix to the day (e.g., "1st", "2nd", "3rd", "4th", etc.)
  String daySuffix;
  if (day >= 11 && day <= 13) {
    daySuffix = "th";
  } else {
    switch (day % 10) {
      case 1:
        daySuffix = "st";
        break;
      case 2:
        daySuffix = "nd";
        break;
      case 3:
        daySuffix = "rd";
        break;
      default:
        daySuffix = "th";
    }
  }

  // Replace the day in the formatted date string with the day plus suffix
  formattedDate = formattedDate.replaceFirst(day.toString(), '$day$daySuffix');

  return [formattedDate, formattedTime];
}

bool sameDay(DateTime dateTime1, DateTime dateTime2) {
  return dateTime1.year == dateTime2.year &&
      dateTime1.month == dateTime2.month &&
      dateTime1.day == dateTime2.day;
}