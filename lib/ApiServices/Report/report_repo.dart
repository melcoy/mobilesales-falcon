import 'package:salesappmobile/ApiServices/Report/report_provider.dart';
import 'package:salesappmobile/Model/Report/ReportSalesModel.dart';

class ReportRepo {
  final ReportProvider _reportProvider = ReportProvider();

  Future<List<ReportSalesModel>> fetchReportSales() =>
      _reportProvider.getReportSales();

}