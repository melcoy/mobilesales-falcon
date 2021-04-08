part of 'listcustomerbloc_bloc.dart';

@immutable
abstract class ListcustomerblocState {}

class ListcustomerblocInitial extends ListcustomerblocState {}

class ListcustomerblocLoading extends ListcustomerblocState {}

class ListcustomerblocFailure extends ListcustomerblocState {
  final String errorMessage;

  ListcustomerblocFailure(this.errorMessage);
}

class ListcustomerblocLoaded extends ListcustomerblocState {
  final List<ListCustomerModel> listCustomerModel;

  ListcustomerblocLoaded(this.listCustomerModel);
}
