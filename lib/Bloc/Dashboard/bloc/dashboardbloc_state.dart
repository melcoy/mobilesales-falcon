part of 'dashboardbloc_bloc.dart';

@immutable
abstract class DashboardblocState {}

class DashboardblocInitial extends DashboardblocState {}

class DashboardblocLoading extends DashboardblocState {}

class DashboardblocSuccess extends DashboardblocState {
  DashboardModel model;
  DashboardblocSuccess(this.model);
}

class DashboardblocFailure extends DashboardblocState {
  String errMsg;

  DashboardblocFailure(this.errMsg);
}
