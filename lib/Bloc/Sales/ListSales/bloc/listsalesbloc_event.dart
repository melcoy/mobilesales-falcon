part of 'listsalesbloc_bloc.dart';

@immutable
abstract class ListsalesblocEvent {}

class ListsalesblocEventStarted extends ListsalesblocEvent {
  final String idCustomer;

  ListsalesblocEventStarted({this.idCustomer});
}
