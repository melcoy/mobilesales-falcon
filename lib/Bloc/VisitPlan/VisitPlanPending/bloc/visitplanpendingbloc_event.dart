part of 'visitplanpendingbloc_bloc.dart';

@immutable
abstract class VisitplanpendingblocEvent {}

class VisitplanpendingblocEventStarted extends VisitplanpendingblocEvent {}

class VisitplanpendingblocEventSavePressed extends VisitplanpendingblocEvent {
  final String idStatusVP;
  final String idPendingReason;
  final String pendingNote;
  final String idVisitPlan;

  VisitplanpendingblocEventSavePressed(
      {@required this.idPendingReason,
      @required this.idStatusVP,
      @required this.pendingNote,
      @required this.idVisitPlan});
}
