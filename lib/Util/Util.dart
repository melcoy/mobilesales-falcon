import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const colorRedFigma = const Color(0xffEB5757);
const colorRedFigmapastel = const Color(0xffFD9898);
const ipHost = "http://34.101.233.146:8069";
const host = "34.101.233.146:8069";
const apikey = "K22H6GAFS47WN5YCGOTD";

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

String timeFormat() {
  DateTime now = new DateTime.now();
  String currentDate = new DateFormat('y-MM-dd kk:mm').format(now);
  var parsedDate = DateTime.parse(currentDate);
  var formatter = new DateFormat('kk:mm');
  String formatted = formatter.format(parsedDate);
  return formatted;
}

class CodeError {
  static httpCheckStatus(http.Response response) {
    int code = response.statusCode;
    if (code == 200) {
      return 1;
    } else if (code == 400) {
      return "Error server, bad request";
    } else if (code == 401) {
      return "Error server, unauthorised";
    } else if (code == 403) {
      return "Error server, forbidden";
    } else if (code == 404) {
      return "Error server, url not found";
    } else if (code == 500) {
      return "Error server, internal error";
    } else if (code == 502) {
      return "Error server, bad gateway";
    } else if (code == 503) {
      return "Error server, service unavailable";
    } else if (code == 504) {
      return "Error server, gateway timeout";
    } else {
      return "Error server, status " + code.toString();
    }
  }
}
