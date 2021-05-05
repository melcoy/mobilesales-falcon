import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Sales/sales_repo.dart';
import 'package:salesappmobile/Model/Sales/ListSalesModel.dart';
import 'package:salesappmobile/Util/Connection.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'listsalesbloc_event.dart';
part 'listsalesbloc_state.dart';

class ListsalesblocBloc extends Bloc<ListsalesblocEvent, ListsalesblocState> {
  ListsalesblocBloc() : super(ListsalesblocInitial());
  final Connection checkConnection = Connection();
  final SalesRepo _repo = SalesRepo();
  @override
  Stream<ListsalesblocState> mapEventToState(
    ListsalesblocEvent event,
  ) async* {
    ListsalesblocLoading();
    bool connect = await checkConnection.initConnectivity();

    if (connect == false) {
      yield ListsalesblocFailure(errMsg: noInternet);
    } else {
      if (event is ListsalesblocEventStarted) {
        List<ListSalesModel> listModel = [];

        listModel = await _repo.fetchetListSalesbyCust(event.idCustomer);

        if (listModel != null) {
          yield ListsalesblocLoaded(model: listModel);
        } else {
          yield ListsalesblocFailure(errMsg: "Data Null");
        }
      }
    }
  }
}
