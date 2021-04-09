import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Spesification/spesification_repo.dart';
import 'package:salesappmobile/Model/spesification/ListTruckModel.dart';

part 'listspesificationbloc_event.dart';
part 'listspesificationbloc_state.dart';

class ListspesificationblocBloc 
    extends Bloc<ListspesificationblocEvent, ListspesificationblocState> {
  SpesificationRepo _spesificationRepo = SpesificationRepo();
  
  ListspesificationblocBloc() : super(ListspesificationblocInitial());

  @override
  Stream<ListspesificationblocState> mapEventToState(
    ListspesificationblocEvent event,
  ) async* {
    yield ListspesificationblocLoading();
    List<ListTruckModel> listTruck =
        await _spesificationRepo.fetchListSpesification();
    if (event is ListspesificationblocEventStarted) {
      if (listTruck.isEmpty) {
        yield ListspesificationblocFailure("Customer Null");
      } else {
        yield ListspesificationblocLoaded(listTruck);
        // print(listTruck);
      }
    }
  }
}
