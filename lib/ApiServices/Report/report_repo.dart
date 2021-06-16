import 'package:salesappmobile/ApiServices/Report/report_provider.dart';
import 'package:salesappmobile/Model/Report/ReportSalesModel.dart';

class ReportRepo {
  final ReportProvider _reportProvider = ReportProvider();

  Future<List<ReportSalesModel>> fetchReportSales(
          String dateStart, String dateEnd) =>
      _reportProvider.getReportSales(dateStart, dateEnd);
}
