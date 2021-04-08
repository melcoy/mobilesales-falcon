import 'package:salesappmobile/ApiServices/Login/login_provider.dart';
import 'package:salesappmobile/Model/Login/user_login.dart';

class ApiLoginRepo {
  final ApiLoginProvider _apiLoginProvider = ApiLoginProvider();

  Future<UserLogin> fetchUserLogin(String email, String password) =>
      _apiLoginProvider.getUserLogin(email, password);
}
