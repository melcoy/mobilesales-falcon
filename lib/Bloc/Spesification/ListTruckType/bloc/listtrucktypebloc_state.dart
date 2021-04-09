part of 'listtrucktypebloc_bloc.dart';

@immutable
abstract class ListtrucktypeblocState {}

class ListtrucktypeblocInitial extends ListtrucktypeblocState {}

class ListtrucktypeblocLoading extends ListtrucktypeblocState {}

class ListtrucktypenblocFailure extends ListtrucktypeblocState {
  final String errorMessage;

  ListtrucktypenblocFailure(this.errorMessage); 
}

class ListtrucktypeblocLoaded extends ListtrucktypeblocState {
  final List<ListTruckTypeModel> listspesificationModel;

  ListtrucktypeblocLoaded(this.listspesificationModel);
}
