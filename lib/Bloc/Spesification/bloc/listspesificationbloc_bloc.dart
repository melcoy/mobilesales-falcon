import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Spesification/spesification_repo.dart';
import 'package:salesappmobile/Model/spesification/ListTruckModel.dart';
import 'package:salesappmobile/Util/Connection.dart';

part 'listspesificationbloc_event.dart';
part 'listspesificationbloc_state.dart';

class ListspesificationblocBloc
    extends Bloc<ListspesificationblocEvent, ListspesificationblocState> {
  SpesificationRepo _spesificationRepo = SpesificationRepo();
  final Connection checkConnection = Connection();

  ListspesificationblocBloc() : super(ListspesificationblocInitial());

  @override
  Stream<ListspesificationblocState> mapEventToState(
    ListspesificationblocEvent event,
  ) async* {
    yield ListspesificationblocLoading();
    bool connect = await checkConnection.initConnectivity();
    if (connect == false) {
      yield ListspesificationblocFailure("No Internet Connection");
    } else {
      List<ListTruckModel> listTruck =
          await _spesificationRepo.fetchListSpesification();
      if (event is ListspesificationblocEventStarted) {
        if (listTruck.isEmpty) {
          yield ListspesificationblocFailure("Spec Null");
        } else {
          yield ListspesificationblocLoaded(listTruck);
          // print(listTruck);
        }
      }
    }
  }
}
