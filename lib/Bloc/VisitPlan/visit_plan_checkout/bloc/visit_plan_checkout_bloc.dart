import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_repo.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanAdd/bloc/visitplanaddbloc_bloc.dart';
import 'package:salesappmobile/Bloc/VisitPlan/VisitPlanCheckIn/bloc/visitplancheckinbloc_bloc.dart';
import 'package:salesappmobile/Model/VisitPlan/Dto/CheckInDto.dart';
import 'package:salesappmobile/Util/Connection.dart';
import 'package:salesappmobile/Util/GetLocation.dart';

part 'visit_plan_checkout_event.dart';
part 'visit_plan_checkout_state.dart';

class VisitPlanCheckoutBloc
    extends Bloc<VisitPlanCheckoutEvent, VisitPlanCheckoutState> {
  VisitPlanCheckoutBloc() : super(VisitPlanCheckoutInitial());
  VisitPlanRepo visitPlanRepo = VisitPlanRepo();
  final Connection checkConnection = Connection();
  final GetLocation _getLocation = GetLocation();
  @override
  Stream<VisitPlanCheckoutState> mapEventToState(
    VisitPlanCheckoutEvent event,
  ) async* {
    if (event is VisitPlanCheckoutPressed) {
      yield VisitPlanCheckoutLoading();

      print("Alfan" + event.dto.idVisitPlan);
      var loc = await _getLocation.getLocation();
      bool result = await visitPlanRepo.fetchCheckout(
          loc[0].toString(), loc[1].toString(), event.dto.idVisitPlan);
      if (result) {
        yield VisitPlanCheckoutSuccess();
      } else {
        yield VisitPlanCheckoutFaillure("Error Checkout");
      }
    }
  }
}
