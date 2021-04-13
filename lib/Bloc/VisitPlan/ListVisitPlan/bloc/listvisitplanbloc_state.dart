part of 'listvisitplanbloc_bloc.dart';

@immutable
abstract class ListvisitplanblocState {}

class ListvisitplanblocInitial extends ListvisitplanblocState {}

class ListvisitplanblocLoading extends ListvisitplanblocState {}

class ListvisitplanblocFailure extends ListvisitplanblocState {
  final String errorMessage;

  ListvisitplanblocFailure(this.errorMessage);
}

class ListvisitplanblocDataNull extends ListvisitplanblocState {
  final String errorMessage;

  ListvisitplanblocDataNull(this.errorMessage);
}

class ListvisitplanLoaded extends ListvisitplanblocState {
  final List<ListVisitPlanModel> listVisitPlanModel;

  ListvisitplanLoaded(this.listVisitPlanModel);
}
