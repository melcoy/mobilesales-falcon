part of 'listtrucktypebloc_bloc.dart';

@immutable
abstract class ListtrucktypeblocEvent {}

class ListtrucktypeblocEventStarted extends ListtrucktypeblocEvent {
  final String id;
  ListtrucktypeblocEventStarted({this.id});
}
