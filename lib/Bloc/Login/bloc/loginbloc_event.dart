part of 'loginbloc_bloc.dart';

@immutable
abstract class LoginblocEvent {}

class LoginButtonPressed extends LoginblocEvent {
  final String email;
  final String password;

  LoginButtonPressed({@required this.email, @required this.password});
}
