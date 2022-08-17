import 'package:intl/intl.dart';

class MonthYear{
   late final int month;
  late final int year;
  MonthYear({required this.month, required this.year});
  MonthYear operator +(int x) {
    if (month == 12) {
      return MonthYear(month: x, year: year + 1);
    } else {
      return MonthYear(month: month + x, year: year);
    }
  }

  MonthYear operator -(int x) {
    if (month == 1) {
      return MonthYear(month: 13-x, year: year - 1);
    } else {
      return MonthYear(month: month - x, year: year);
    }
  }

  @override
  String toString() {
    return "${DateFormat('MMMM').format(DateTime(0, month))} $year";
  }

  MonthYear.fromDateTime(DateTime dateTime) {
    month = dateTime.month;
    year = dateTime.year;
  }

}