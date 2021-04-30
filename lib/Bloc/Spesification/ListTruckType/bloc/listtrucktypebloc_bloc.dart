import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Spesification/spesification_repo.dart';
import 'package:salesappmobile/Model/spesification/ListTruckTypeModel.dart';

part 'listtrucktypebloc_event.dart';
part 'listtrucktypebloc_state.dart';

class ListtrucktypeblocBloc
    extends Bloc<ListtrucktypeblocEvent, ListtrucktypeblocState> {
  SpesificationRepo _spesificationRepo = SpesificationRepo();

  ListtrucktypeblocBloc() : super(ListtrucktypeblocInitial());

  @override
  Stream<ListtrucktypeblocState> mapEventToState(
    ListtrucktypeblocEvent event,
  ) async* {
    if (event is ListtrucktypeblocEventStarted) {
      yield ListtrucktypeblocLoading();
      List<ListTruckTypeModel> listTrucktype =
          await _spesificationRepo.fetchListTruckType(event.id);
      if (listTrucktype.isEmpty) {
        yield ListtrucktypenblocFailure("Customer Null");
      } else {
        yield ListtrucktypeblocLoaded(listTrucktype);
      }
    }
  }
}
