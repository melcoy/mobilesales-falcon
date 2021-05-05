part of 'dashboardbloc_bloc.dart';

@immutable
abstract class DashboardblocState {}

class DashboardblocInitial extends DashboardblocState {}

class DashboardblocLoading extends DashboardblocState {}

class DashboardblocSuccess extends DashboardblocState {
  final DashboardModel model;
  DashboardblocSuccess(this.model);
}

class DashboardblocFailure extends DashboardblocState {
  final String errMsg;

  DashboardblocFailure(this.errMsg);
}
