part of 'listsubtypebloc_bloc.dart';

@immutable
abstract class ListsubtypeblocState {}

class ListsubtypeblocInitial extends ListsubtypeblocState {}

class ListsubtypeblocLoading extends ListsubtypeblocState {}

class ListsubtypeblocFailure extends ListsubtypeblocState {
  final String errorMessage;

  ListsubtypeblocFailure(this.errorMessage); 
}

class ListsubtypeblocLoaded extends ListsubtypeblocState {
  final List<ListSubTypeModel> listssubModel;

  ListsubtypeblocLoaded(this.listssubModel);
}
