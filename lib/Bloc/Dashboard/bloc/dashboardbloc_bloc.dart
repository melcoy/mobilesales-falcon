import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Dashboard/dashboard_repo.dart';
import 'package:salesappmobile/Model/Dashboard/DashboardModel.dart';

import 'package:salesappmobile/Util/Connection.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'dashboardbloc_event.dart';
part 'dashboardbloc_state.dart';

class DashboardblocBloc extends Bloc<DashboardblocEvent, DashboardblocState> {
  DashboardblocBloc() : super(DashboardblocInitial());

  final Connection checkConnection = Connection();
  final DashboardRepo _dashboardRepo = DashboardRepo();
  DashboardModel model = DashboardModel();

  @override
  Stream<DashboardblocState> mapEventToState(
    DashboardblocEvent event,
  ) async* {
    bool connect = await checkConnection.initConnectivity();

    if (connect == true) {
      yield DashboardblocLoading();
      model = await _dashboardRepo.fetchDashboardData(
          "${timeFormatPlus(0)} 00:00:00", "${timeFormatPlus(1)} 23:59:59");
      if (model != null) {
        yield DashboardblocSuccess(model);
      } else {
        yield DashboardblocFailure("Model Null");
      }
    } else {
      yield DashboardblocFailure(noInternet);
    }
  }
}
