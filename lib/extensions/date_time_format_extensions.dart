import 'package:intl/intl.dart';

extension DateTimeFormatExtensions on DateTime {
  String toFormattedString() {
    return DateFormat("MMMM d, y").format(this);
  }
}
