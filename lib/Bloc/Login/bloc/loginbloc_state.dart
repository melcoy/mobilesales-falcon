part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocState {}

class LoginblocInitial extends LoginblocState {}

class LoginblocLoading extends LoginblocState {}

class LoginblocFailure extends LoginblocState {
  final String errorMessage;

  LoginblocFailure(this.errorMessage);
}

class LoginSuccess extends LoginblocState {
  final UserLogin userLogin;
  final String loginMessage;

  LoginSuccess(this.userLogin, this.loginMessage);
}
