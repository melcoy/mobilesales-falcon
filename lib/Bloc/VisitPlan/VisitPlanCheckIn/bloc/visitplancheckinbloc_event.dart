part of 'visitplancheckinbloc_bloc.dart';

@immutable
abstract class VisitplancheckinblocEvent {}

class VisitplancheckinblocEventCapture extends VisitplancheckinblocEvent {
  final String visitId;
  final String path;

  VisitplancheckinblocEventCapture({this.visitId, this.path});
}
