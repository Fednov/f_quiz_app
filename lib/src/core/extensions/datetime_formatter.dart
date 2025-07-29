import 'package:intl/intl.dart';

extension DateTimeFormatter on DateTime {
  String toStringFormatDMYKM() {
    var formattedDate = DateFormat('dd.MM.yyyy – kk:mm').format(this);

    return formattedDate;
  }

  String toStringFormatDMY() {
    var formattedDate = DateFormat('dd.MM.yyyy').format(this);

    return formattedDate;
  }
}
