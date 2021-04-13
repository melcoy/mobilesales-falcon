part of 'listvisitplanbloc_bloc.dart';

@immutable
abstract class ListvisitplanblocEvent {}


class ListvisitplanblocEventStarted extends ListvisitplanblocEvent {}
class ListvisitplanblocEventSearch extends ListvisitplanblocEvent {
  final String searchText;

  ListvisitplanblocEventSearch({@required this.searchText});
}

class ListvisitplanblocEventDateSearch extends ListvisitplanblocEvent {
  final String dateStart;
  final String dateEnd;

  ListvisitplanblocEventDateSearch(
      {@required this.dateStart, @required this.dateEnd});
}

