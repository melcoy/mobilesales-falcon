part of 'listspesificationbloc_bloc.dart';

@immutable
abstract class ListspesificationblocState {}

class ListspesificationblocInitial extends ListspesificationblocState {}

class ListspesificationblocLoading extends ListspesificationblocState {}

class ListspesificationblocFailure extends ListspesificationblocState {
  final String errorMessage;

  ListspesificationblocFailure(this.errorMessage); 
}

class ListspesificationblocLoaded extends ListspesificationblocState {
  final List<ListTruckModel> listspesificationModel;

  ListspesificationblocLoaded(this.listspesificationModel);
}