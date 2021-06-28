import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Report/report_repo.dart';
import 'package:salesappmobile/Model/Report/ReportSalesModel.dart';
import 'package:salesappmobile/Util/Util.dart';
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
    List<ReportSalesModel> reportSales = [];
    DateTime now = new DateTime.now();
    String monthDate = new DateFormat('MM').format(now);
    String yearDate = new DateFormat('y').format(now);
    if (event is ReportsalesblocEventStarted) {
      yield ReportsalesblocLoading();
      // print('now.year');
      // print(now.month);
      if(now.year%4 == 0){
        if(now.month == 2){
          reportSales = await _spesificationRepo.fetchReportSales(
              "${timeFormatReportSales(0)}-1 00:00:00", "${timeFormatReportSales(1)}-29 23:59:59");
        }
      }
      else {
        if(now.month == 1 || now.month == 3 ||now.month == 5 ||now.month == 7 ||now.month == 8 ||now.month == 10 ||now.month == 12 ){
          reportSales = await _spesificationRepo.fetchReportSales(
              "${timeFormatReportSales(0)}-1 00:00:00", "${timeFormatReportSales(1)}-31 23:59:59");
        }
        else {
          reportSales = await _spesificationRepo.fetchReportSales(
              "${timeFormatReportSales(0)}-1 00:00:00", "${timeFormatReportSales(1)}-30 23:59:59");
        }

      }
      print('reportSales ');
      print(reportSales);
      // List<ReportSalesModel> reportSales =
      //     await _spesificationRepo.fetchReportSales(
      //         "${timeFormatReportSales(0)}-1 00:00:00", "${timeFormatReportSales(1)}-30 23:59:59");
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
