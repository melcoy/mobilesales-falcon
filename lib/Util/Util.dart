import 'dart:ui';

import 'package:intl/intl.dart';

const colorRedFigma = const Color(0xffEB5757);
const colorRedFigmapastel = const Color(0xffFD9898);

String dateFormat() {
  DateTime now = new DateTime.now();
  String currentDate = new DateFormat('y-MM-dd').format(now);
  var parsedDate = DateTime.parse(currentDate);
  var formatter = new DateFormat('dd MMM yyyy');
  String formatted = formatter.format(parsedDate);
  return formatted;
}

String timeFormat() {
  DateTime now = new DateTime.now();
  String currentDate = new DateFormat('y-MM-dd kk:mm').format(now);
  var parsedDate = DateTime.parse(currentDate);
  var formatter = new DateFormat('kk:mm');
  String formatted = formatter.format(parsedDate);
  return formatted;
}
