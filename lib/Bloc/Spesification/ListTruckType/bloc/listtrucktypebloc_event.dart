part of 'listtrucktypebloc_bloc.dart';

@immutable
abstract class ListtrucktypeblocEvent {}

class ListtrucktypeblocEventStarted extends ListtrucktypeblocEvent {
  String id;
  ListtrucktypeblocEventStarted({this.id});

}
