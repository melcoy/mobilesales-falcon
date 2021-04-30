part of 'salesinputbloc_bloc.dart';

@immutable
abstract class SalesinputblocState {}

class SalesinputblocInitial extends SalesinputblocState {}

class SalesinputblocLoading extends SalesinputblocState {}

class SalesinputblocFailure extends SalesinputblocState {
  final String errMsg;
  SalesinputblocFailure({@required this.errMsg});
}

class SalesinputblocLoaded extends SalesinputblocState {
  final List<ListAllTruckModel> listAllProduct;
  SalesinputblocLoaded({@required this.listAllProduct});
}

class SalesinputblocSaved extends SalesinputblocState {}
