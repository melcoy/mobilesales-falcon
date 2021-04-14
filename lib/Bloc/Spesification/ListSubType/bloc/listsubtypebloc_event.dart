part of 'listsubtypebloc_bloc.dart';

@immutable
abstract class ListsubtypeblocEvent {}

class ListsubtypeblocEventStarted extends ListsubtypeblocEvent {
  String id;
  ListsubtypeblocEventStarted({this.id});

}
