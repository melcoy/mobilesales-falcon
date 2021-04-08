import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:salesappmobile/Model/Login/user_login.dart';

import '../../Util/Util.dart';

class ApiLoginProvider {
  Future<UserLogin> getUserLogin(String email, String password) async {
    final String _baseUrl = '$ipHost/api/ver1/salesman/login';
    Map credential = {'email': email, 'password': password};
    try {
      var body = json.encode(credential);
      http.Response response = await http.post(Uri.encodeFull(_baseUrl),
          body: body, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        return UserLogin.loginUser(decode['data'][0]);
      } else {
        return UserLogin.withError(response.statusCode.toString());
      }
    } catch (error) {
      return UserLogin.withError(error.toString());
    }
  }
}
