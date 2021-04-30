part of 'visitplancheckinbloc_bloc.dart';

@immutable
abstract class VisitplancheckinblocState {}

class VisitplancheckinblocInitial extends VisitplancheckinblocState {}

class VisitplancheckinblocLoading extends VisitplancheckinblocState {}

class VisitplancheckinblocSuccess extends VisitplancheckinblocState {
  final String succMsg;

  VisitplancheckinblocSuccess({@required this.succMsg});
}

class VisitplancheckinblocFaillure extends VisitplancheckinblocState {
  final String errMsg;

  VisitplancheckinblocFaillure({@required this.errMsg});
}
