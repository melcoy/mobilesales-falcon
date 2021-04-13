part of 'customeraddbloc_bloc.dart';

@immutable
abstract class CustomeraddblocState {}

class CustomeraddblocInitial extends CustomeraddblocState {}

//// state untuk addCustomer

class CustomeraddblocLoading extends CustomeraddblocState {}

class CustomeraddblocSuccess extends CustomeraddblocState {
  final String msg;
  CustomeraddblocSuccess({this.msg});
}

class CustomeraddblocFailure extends CustomeraddblocState {
  final String errorMsg;
  CustomeraddblocFailure({this.errorMsg});
}

//// state untuk manggil kota dan provinsi
class CustomeraddblocMasterLoading extends CustomeraddblocState {}

class CustomeraddblocMasterFailure extends CustomeraddblocState {
  final String errorMsg;
  CustomeraddblocMasterFailure({this.errorMsg});
}

class CustomeraddblocMasterLoaded extends CustomeraddblocState {
  final List<dynamic> kotaModel;
  final List<dynamic> provinsiModel;

  CustomeraddblocMasterLoaded({this.kotaModel, this.provinsiModel});
}
