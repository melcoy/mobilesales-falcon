part of 'reportsalesbloc_bloc.dart';

@immutable
abstract class ReportsalesblocState {}

class ReportsalesblocInitial extends ReportsalesblocState {}

class ReportsalesblocLoading extends ReportsalesblocState {}

class ReportsalesblocFailure extends ReportsalesblocState {
  final String errorMessage;

  ReportsalesblocFailure(this.errorMessage); 
}

class ReportsalesblocLoaded extends ReportsalesblocState {
  final List<ReportSalesModel> reportsalesModel;

  ReportsalesblocLoaded(this.reportsalesModel);
}
