part of 'visitplanpendingbloc_bloc.dart';

@immutable
abstract class VisitplanpendingblocState {}

class VisitplanpendingblocInitial extends VisitplanpendingblocState {}

class VisitplanpendingblocLoading extends VisitplanpendingblocState {}

class VisitplanpendingblocLoaded extends VisitplanpendingblocState {
  final List<dynamic> listStatusPending;
  final List<dynamic> listReason;
  VisitplanpendingblocLoaded(
      {@required this.listStatusPending, @required this.listReason});
}

class VisitplanpendingblocFaillure extends VisitplanpendingblocState {
  final String errMsg;

  VisitplanpendingblocFaillure({@required this.errMsg});
}

class VisitplanpendingblocSuccess extends VisitplanpendingblocState {
  final String succMsg;

  VisitplanpendingblocSuccess({@required this.succMsg});
}
