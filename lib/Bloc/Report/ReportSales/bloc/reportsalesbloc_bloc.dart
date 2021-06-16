import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Report/report_repo.dart';
import 'package:salesappmobile/Model/Report/ReportSalesModel.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'reportsalesbloc_event.dart';
part 'reportsalesbloc_state.dart';

class ReportsalesblocBloc
    extends Bloc<ReportsalesblocEvent, ReportsalesblocState> {
  ReportRepo _spesificationRepo = ReportRepo();

  ReportsalesblocBloc() : super(ReportsalesblocInitial());

  @override
  Stream<ReportsalesblocState> mapEventToState(
    ReportsalesblocEvent event,
  ) async* {
    if (event is ReportsalesblocEventStarted) {
      yield ReportsalesblocLoading();
      List<ReportSalesModel> reportSales =
          await _spesificationRepo.fetchReportSales(
              "${timeFormatPlus(0)} 00:00:00", "${timeFormatPlus(1)} 23:59:59");
      if (reportSales.isEmpty) {
        yield ReportsalesblocFailure("Customer Null");
      } else {
        yield ReportsalesblocLoaded(reportSales);
      }
    }
  }
}
