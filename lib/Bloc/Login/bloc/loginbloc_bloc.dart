import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Login/login_repo.dart';
import 'package:salesappmobile/Model/Login/user_login.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'loginbloc_event.dart';
part 'loginbloc_state.dart';

class LoginblocBloc extends Bloc<LoginblocEvent, LoginblocState> {
  final ApiLoginRepo _apiLoginRepo = ApiLoginRepo();
  LoginblocBloc() : super(LoginblocInitial());

  @override
  Stream<LoginblocState> mapEventToState(
    LoginblocEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginblocLoading();

      UserLogin login =
          await _apiLoginRepo.fetchUserLogin(event.email, event.password);

      if (login.error != null) {
        yield LoginblocFailure(login.error);
      } else {
        saveDataUser(login.session, login.id, login.pusat, login.cabang,
            login.subCabang);

        yield LoginSuccess(login, "Login Sucessfully");
      }
    }
  }
}
