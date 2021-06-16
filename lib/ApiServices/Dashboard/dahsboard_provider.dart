import 'package:salesappmobile/Model/Dashboard/DashboardModel.dart';
import 'package:salesappmobile/Model/Dashboard/DashboardTotalSalesModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DashboardProvider {
  Future<DashboardModel> getDashboardData(
      String dateStart, String dateEnd) async {
    String session = await getSession();
    String id = await getIdUser();
    final queryParameters = {
      'id': id,
      'session': session,
      'start': dateStart,
      'end': dateEnd
    };

    final uri = Uri.http(host, '/api/ver1/salesman/kpi/', queryParameters);

    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);

      //model = DashboardModel.fromJson(decode['data'][0]);
      //print(decode['data'][0]);
      if (response.statusCode == 200) {
        // List<dynamic> listJsonVp = (decode as Map<String, dynamic>)['data'];
        // print(listJsonVp);
        print(decode['data'][0]);
        DashboardModel model = DashboardModel.fromJson(decode['data'][0]);
    
        print('model = ');
        print(model);
        return model;
      } else {
        return DashboardModel.withError("Api Error");
      }
    } catch (error) {
      return DashboardModel.withError(error.toString());
    }
  }

  Future<List<DashboardTotalSalesModel>> getTotalReportSales() async {
    String session = await getSession();
    String id = await getIdUser();
    final queryParameters = {
      'id': id,
      'session': session,
    };
    final uri = Uri.http(host, '/api/ver1/salesman/sales/total', queryParameters);

    List<DashboardTotalSalesModel> listReport = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listJsonReport = (decode as Map<String, dynamic>)['data'];
        for (int i = 0; i < listJsonReport.length; i++) {
          listReport.add(DashboardTotalSalesModel.fromJson(listJsonReport[i]));
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
