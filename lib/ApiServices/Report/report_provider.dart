import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/Model/Report/ReportSalesModel.dart';
import 'package:salesappmobile/Util/Util.dart';

class ReportProvider {
  Future<List<ReportSalesModel>> getReportSales() async {
    String start;
    String end;
    String session = await getSession();
    String id = await getIdUser();
    final queryParameters = {
      'id': id,
      'session': session,
      'start': '2021-03-07 00:00:00',
      'end': '2021-04-07 23:59:00',
    };
    final uri = Uri.http(host, '/api/ver1/salesman/kpi/', queryParameters);

    List<ReportSalesModel> listReport = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      // print('----------------decode');
      // print(response.statusCode);
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
