import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_repo.dart';
import 'package:salesappmobile/Model/VisitPlan/ListVisitPlanModel.dart';
import 'package:salesappmobile/Util/Connection.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'listvisitplanbloc_event.dart';
part 'listvisitplanbloc_state.dart';

class ListvisitplanblocBloc
    extends Bloc<ListvisitplanblocEvent, ListvisitplanblocState> {
  ListvisitplanblocBloc() : super(ListvisitplanblocInitial());
  final Connection checkConnection = Connection();
  VisitPlanRepo _visitPlanRepo = VisitPlanRepo();
  @override
  Stream<ListvisitplanblocState> mapEventToState(
    ListvisitplanblocEvent event,
  ) async* {
    bool connect = await checkConnection.initConnectivity();
    yield ListvisitplanblocLoading();
    if (connect == false) {
      yield ListvisitplanblocFailure(noInternet);
    } else {
      List<ListVisitPlanModel> listVp;
      listVp = await _visitPlanRepo.fetchListVp(
          "${timeFormatPlus(0)} 00:00:00", "${timeFormatPlus(1)} 23:59:59");

      if (event is ListvisitplanblocEventStarted) {
        if (listVp.isEmpty) {
          yield ListvisitplanblocDataNull("Visit Plan Empty");
        } else {
          yield ListvisitplanLoaded(listVp);
        }
      }

      if (event is ListvisitplanblocEventSearch) {
        if (listVp.isEmpty) {
          yield ListvisitplanblocDataNull("Visit Plan Empty");
        } else {
          List<ListVisitPlanModel> listVpSearch = [];

          for (int i = 0; i < listVp.length; i++) {
            if (listVp[i]
                .name
                .toLowerCase()
                .contains(event.searchText.toLowerCase())) {
              listVpSearch.add(listVp[i]);
            }
          }
          yield ListvisitplanLoaded(listVpSearch);
        }
      }

      if (event is ListvisitplanblocEventDateSearch) {
        List<ListVisitPlanModel> listVpDate = [];

        listVpDate =
            await _visitPlanRepo.fetchListVp(event.dateStart, event.dateEnd);

        if (listVpDate.isEmpty) {
          yield ListvisitplanblocDataNull("Visit Plan Empty");
        } else {
          yield ListvisitplanLoaded(listVpDate);
        }
      }
    }
  }
}
