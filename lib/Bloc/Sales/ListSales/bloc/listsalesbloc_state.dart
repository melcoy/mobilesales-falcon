part of 'listsalesbloc_bloc.dart';

@immutable
abstract class ListsalesblocState {}

class ListsalesblocInitial extends ListsalesblocState {}

class ListsalesblocLoading extends ListsalesblocState {}

class ListsalesblocFailure extends ListsalesblocState {
  final String errMsg;
  ListsalesblocFailure({@required this.errMsg});
}

class ListsalesblocLoaded extends ListsalesblocState {
  final List<ListSalesModel> model;
  ListsalesblocLoaded({@required this.model});
}
