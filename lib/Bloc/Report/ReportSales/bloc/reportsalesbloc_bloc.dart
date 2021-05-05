import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Report/report_repo.dart';
import 'package:salesappmobile/Model/Report/ReportSalesModel.dart';
import 'package:salesappmobile/Model/Report/ReportTotalSalesModel.dart';

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
          await _spesificationRepo.fetchReportSales();
      List<ReportTotalSalesModel> reportTotalSales =
          await _spesificationRepo.fetchTotalReportSales();
      if (reportSales.isEmpty) {
        yield ReportsalesblocFailure("Customer Null");
      } else {
        yield ReportsalesblocLoaded(reportSales,reportTotalSales);
      }
    }
  }
}
