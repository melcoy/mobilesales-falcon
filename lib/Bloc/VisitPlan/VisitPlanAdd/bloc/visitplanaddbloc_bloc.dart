import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_repo.dart';
import 'package:salesappmobile/Model/VisitPlan/VisitPlanAddModel.dart';
import 'package:salesappmobile/Util/Connection.dart';

part 'visitplanaddbloc_event.dart';
part 'visitplanaddbloc_state.dart';

class VisitplanaddblocBloc
    extends Bloc<VisitplanaddblocEvent, VisitplanaddblocState> {
  VisitplanaddblocBloc() : super(VisitplanaddblocInitial());
  final Connection checkConnection = Connection();
  final VisitPlanRepo _visitPlanRepo = VisitPlanRepo();
  @override
  Stream<VisitplanaddblocState> mapEventToState(
    VisitplanaddblocEvent event,
  ) async* {
    if (event is VisitplanaddblocEventSave) {
      yield VisitplanaddblocLoading();
      bool connect = await checkConnection.initConnectivity();
      if (connect == false) {
        yield VisitplanaddblocFailure(errMsg: "Faillure");
      } else {
        yield VisitplanaddblocLoading();
        bool saved = await _visitPlanRepo.fetchAddVisitPlan(event.model);
        if (saved == false) {
          yield VisitplanaddblocFailure(
              errMsg: "Failed Created Customer, Try Again");
        } else {
          yield VisitplanaddblocSuccess(succMsg: "Data has been saved");
        }
      }
    }
  }
}
