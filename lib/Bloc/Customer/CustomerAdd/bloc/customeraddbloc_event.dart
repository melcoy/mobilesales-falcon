part of 'customeraddbloc_bloc.dart';

@immutable
abstract class CustomeraddblocEvent {}

class CustomeraddblocEventStart extends CustomeraddblocEvent {}

class CustomeraddblocEventSave extends CustomeraddblocEvent {
  final CustomerAddDto model;

  CustomeraddblocEventSave(this.model);
}
