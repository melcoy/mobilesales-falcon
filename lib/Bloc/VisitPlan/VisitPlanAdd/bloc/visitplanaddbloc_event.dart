part of 'visitplanaddbloc_bloc.dart';

@immutable
abstract class VisitplanaddblocEvent {}

class VisitplanaddblocEventSave extends VisitplanaddblocEvent {
  final VisitPlanAddModel model;
  VisitplanaddblocEventSave({this.model});
}
