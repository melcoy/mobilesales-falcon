part of 'visitplanpendingbloc_bloc.dart';

@immutable
abstract class VisitplanpendingblocEvent {}

class VisitplanpendingblocEventStarted extends VisitplanpendingblocEvent {}

class VisitplanpendingblocEventSavePressed extends VisitplanpendingblocEvent {
  final String idStatusVP;
  final String idPendingReason;
  final String pendingNote;

  VisitplanpendingblocEventSavePressed(
      {this.idPendingReason, this.idStatusVP, this.pendingNote});
}
