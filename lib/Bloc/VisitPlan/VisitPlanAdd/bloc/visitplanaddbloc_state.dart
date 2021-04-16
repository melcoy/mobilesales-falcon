part of 'visitplanaddbloc_bloc.dart';

@immutable
abstract class VisitplanaddblocState {}

class VisitplanaddblocInitial extends VisitplanaddblocState {}

class VisitplanaddblocLoading extends VisitplanaddblocState {}

class VisitplanaddblocFailure extends VisitplanaddblocState {
  final String errMsg;
  VisitplanaddblocFailure({@required this.errMsg});
}

class VisitplanaddblocSuccess extends VisitplanaddblocState {
  final String succMsg;
  VisitplanaddblocSuccess({@required this.succMsg});
}
