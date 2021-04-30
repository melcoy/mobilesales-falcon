part of 'visitplanpendingbloc_bloc.dart';

@immutable
abstract class VisitplanpendingblocState {}

class VisitplanpendingblocInitial extends VisitplanpendingblocState {}

class VisitplanpendingblocLoading extends VisitplanpendingblocState {}

class VisitplanpendingblocLoaded extends VisitplanpendingblocState {
  List<dynamic> listStatusPending;
  List<dynamic> listReason;
  VisitplanpendingblocLoaded(
      {@required this.listStatusPending, @required this.listReason});
}

class VisitplanpendingblocFaillure extends VisitplanpendingblocState {
  String errMsg;

  VisitplanpendingblocFaillure({@required this.errMsg});
}
