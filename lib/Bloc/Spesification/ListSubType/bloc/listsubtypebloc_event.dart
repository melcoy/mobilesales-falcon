part of 'listsubtypebloc_bloc.dart';

@immutable
abstract class ListsubtypeblocEvent {}

class ListsubtypeblocEventStarted extends ListsubtypeblocEvent {
  final String id;
  ListsubtypeblocEventStarted({this.id});
}
