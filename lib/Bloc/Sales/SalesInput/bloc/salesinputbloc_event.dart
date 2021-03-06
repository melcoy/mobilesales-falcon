part of 'salesinputbloc_bloc.dart';

@immutable
abstract class SalesinputblocEvent {}

class SaleSalesinputblocEventStarted extends SalesinputblocEvent {}

class SaleSalesinputblocEventSearch extends SalesinputblocEvent {
  final String searchProduct;
  SaleSalesinputblocEventSearch({this.searchProduct});
}

class SaleSalesinputblocEventSaved extends SalesinputblocEvent {
  final SalesInputSavedDto model;

  SaleSalesinputblocEventSaved({this.model});
}
