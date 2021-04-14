part of 'listproductdetailbloc_bloc.dart';

@immutable
abstract class ListproductdetailblocEvent {}

class ListproductdetailblocEventStarted extends ListproductdetailblocEvent {
  String id;
  ListproductdetailblocEventStarted({this.id});

}