import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_repo.dart';
import 'package:salesappmobile/Util/Connection.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'visitplanpendingbloc_event.dart';
part 'visitplanpendingbloc_state.dart';

class VisitplanpendingblocBloc
    extends Bloc<VisitplanpendingblocEvent, VisitplanpendingblocState> {
  VisitplanpendingblocBloc() : super(VisitplanpendingblocInitial());

  final Connection checkConnection = Connection();
  final VisitPlanRepo _visitPlanRepo = VisitPlanRepo();
  @override
  Stream<VisitplanpendingblocState> mapEventToState(
    VisitplanpendingblocEvent event,
  ) async* {
    bool connect = await checkConnection.initConnectivity();

    yield VisitplanpendingblocLoading();
    if (connect != true) {
      yield VisitplanpendingblocFaillure(
        errMsg: noInternet,
      );
    } else {
      if (event is VisitplanpendingblocEventStarted) {
        List<dynamic> listStatusPending;
        List<dynamic> listReason;

        listStatusPending = await _visitPlanRepo.fetchgetStatusVisitPlan();
        listReason = await _visitPlanRepo.fetchPendingReasonVisitPlan();

        if (listStatusPending != null) {
          yield VisitplanpendingblocLoaded(
              listStatusPending: listStatusPending, listReason: listReason);
        } else {
          yield VisitplanpendingblocFaillure(errMsg: "Null");
        }
      }
    }

    if (event is VisitplanpendingblocEventSavePressed) {
      if (connect == true) {
        yield VisitplanpendingblocLoading();
        bool savedVP = await _visitPlanRepo.fetchUpdateStatusVisitPlan(
            event.idStatusVP, event.idVisitPlan);

        bool savedMarkReason = await _visitPlanRepo.fetchMarkPendingReason(
            event.idPendingReason, event.idVisitPlan, event.pendingNote);
        if (savedVP != false && savedMarkReason != false) {
          yield VisitplanpendingblocSuccess(
              succMsg: "Data has been Succesfuly Added");
        } else {
          yield VisitplanpendingblocFaillure(errMsg: "Data Error");
        }
      } else {
        yield VisitplanpendingblocFaillure(
          errMsg: noInternet,
        );
      }
    }
  }
}
