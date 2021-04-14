part of 'listproductdetailbloc_bloc.dart';

@immutable
abstract class ListproductdetailblocState {}

class ListproductdetailblocInitial extends ListproductdetailblocState {}

class ListproductdetailblocLoading extends ListproductdetailblocState {}

class ListproductdetailblocFailure extends ListproductdetailblocState {
  final String errorMessage;

  ListproductdetailblocFailure(this.errorMessage); 
}

class ListproductdetailblocLoaded extends ListproductdetailblocState {
  final List<ListTruckDetailDTO> listdetailModel;

  ListproductdetailblocLoaded(this.listdetailModel);
}

