import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

const colorRedFigma = const Color(0xffEB5757);
const colorRedFigmapastel = const Color(0xffFD9898);

const ipHost = "http://103.25.222.131:8069";
const host = "103.25.222.131:8069";

const apikey = "K22H6GAFS47WN5YCGOTD";
const noInternet = "No Internet Connection";
const cloudinaryAPIKey = '341321521312815';
const cloudinaryAPISecret = '2623v9rkZAXBfh_GJpa3_F8Rw9c';
const cloudinaryCloud = 'sinarmas-logistik';

void saveDataUser(String session, String id, String pusat, String cabang,
    String subcabang) async {
  SharedPreferences pref = await SharedPreferences.getInstance();

  pref.setString("session", session);
  pref.setString("id", id);
  pref.setString("pusat", pusat);
  pref.setString("cabang", cabang);
  pref.setString("subcabang", subcabang);
}

void deleteSession() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.clear();
}

Future<String> getSession() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("session") ?? "Session Expired";
}

Future<String> getIdPusat() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("pusat") ?? "ID Pusat null";
}

Future<String> getIdUser() async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  return pref.getString("id") ?? "ID null";
}

String dateFormat() {
  DateTime now = new DateTime.now();
  String currentDate = new DateFormat('y-MM-dd').format(now);
  var parsedDate = DateTime.parse(currentDate);
  var formatter = new DateFormat('dd MMM yyyy');
  String formatted = formatter.format(parsedDate);
  return formatted;
}

String timeFormatPlus(int month) {
  DateTime now = new DateTime.now();
  var newDate = new DateTime(now.year, now.month + month, now.day);
  String currentDate = new DateFormat('y-MM-dd kk:mm:ss').format(newDate);
  // var parsedDate = DateTime.parse(currentDate);
  // var formatter = new DateFormat('kk:mm');
  // String formatted = formatter.format(parsedDate);
  return currentDate.toString();
}

String timeFormatOneMonth(int month) {
  DateTime now = new DateTime.now();
  var newDate = new DateTime(now.year, now.month - 1, now.day);
  String currentDate = new DateFormat('y-MM-dd').format(newDate);
  // var parsedDate = DateTime.parse(currentDate);
  // var formatter = new DateFormat('kk:mm');
  // String formatted = formatter.format(parsedDate);
  return currentDate.toString();
}

String timeFormat(DateTime now) {
  var newDate = new DateTime(now.year, now.month, now.day);
  String currentDate = new DateFormat('y-MM-dd').format(newDate);
}

// String timeFormat(DateTime now) {
//   var newDate = new DateTime(now.year, now.month, now.day);
//   String currentDate = new DateFormat('y-MM-dd hh:mm:ss').format(newDate);
// }

String datePick(DateTime now) {
  var newDate = new DateTime(now.year, now.month, now.day);
  String currentDate = new DateFormat('y-MM-dd').format(newDate);
  // var parsedDate = DateTime.parse(currentDate);
  // var formatter = new DateFormat('kk:mm');
  // String formatted = formatter.format(parsedDate);
  return currentDate.toString();
}
