import 'package:flutter/material.dart';

class GetFormattedDate extends StatelessWidget{
  final day = DateTime.now().weekday;
  final month = DateTime.now().month;
  final date = DateTime.now().day - 1;
  final year = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
      return Text(
        '${printWeekday()}, ${printMonth()} ${printDay()}, ${printYear()}'
      );
  }

  String printDay() {
    return date.toString();
  }

  String printYear() {
    return year.toString();
  }

  String printWeekday() {
    List<String> weekList = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
    ];
    return weekList[day - 1];
  }

  String printMonth() {
    List<String> monthList = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return monthList[month - 1];
  }
}
