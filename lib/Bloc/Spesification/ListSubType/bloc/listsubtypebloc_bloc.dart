import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Spesification/spesification_repo.dart';
import 'package:salesappmobile/Model/spesification/ListSubTypeModel.dart';

part 'listsubtypebloc_event.dart';
part 'listsubtypebloc_state.dart';

class ListsubtypeblocBloc
    extends Bloc<ListsubtypeblocEvent, ListsubtypeblocState> {
  SpesificationRepo _spesificationRepo = SpesificationRepo();

  ListsubtypeblocBloc() : super(ListsubtypeblocInitial());

  @override
  Stream<ListsubtypeblocState> mapEventToState(
    ListsubtypeblocEvent event,
  ) async* {
    if (event is ListsubtypeblocEventStarted) {
      yield ListsubtypeblocLoading();
      List<ListSubTypeModel> listTrucktype =
          await _spesificationRepo.getListSubType(event.id);
      if (listTrucktype.isEmpty) {
        yield ListsubtypeblocFailure("Customer Null");
      } else {
        yield ListsubtypeblocLoaded(listTrucktype);
      }
    }
  }
}