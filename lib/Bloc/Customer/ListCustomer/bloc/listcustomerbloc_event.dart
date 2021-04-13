part of 'listcustomerbloc_bloc.dart';

@immutable
abstract class ListcustomerblocEvent {}

class ListcustomerblocEventStarted extends ListcustomerblocEvent {}

class ListcustomerblocEventSearch extends ListcustomerblocEvent {
  final String searchText;

  ListcustomerblocEventSearch({@required this.searchText});
}
