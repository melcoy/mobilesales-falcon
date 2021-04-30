import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/Model/Report/ReportSalesModel.dart';
import 'package:salesappmobile/Util/Util.dart';

class ReportProvider {
  Future<List<ReportSalesModel>> getReportSales() async {
    String start = await timeFormatOneMonth(DateTime.now().month)+' 00:00:00';
    String end = await timeFormat(DateTime.now())+' 23:59:59';
    String session = await getSession();
    String id = await getIdUser();
    final queryParameters = {
      'id': id,
      'session': session,
      'start': start,
      'end': end,
    };
    final uri = Uri.http(host, '/api/ver1/salesman/kpi/', queryParameters);

    List<ReportSalesModel> listReport = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listJsonReport = (decode as Map<String, dynamic>)['data'];
        for (int i = 0; i < listJsonReport.length; i++) {
          listReport.add(ReportSalesModel.fromJson(listJsonReport[i]));
        }
      } else {
        return listReport;
      }
    } catch (error) {
      return listReport;
    }
    return listReport;
  }
}
