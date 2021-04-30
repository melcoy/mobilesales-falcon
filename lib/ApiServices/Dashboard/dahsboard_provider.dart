import 'package:salesappmobile/Model/Dashboard/DashboardModel.dart';
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

    DashboardModel model;

    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);

      //model = DashboardModel.fromJson(decode['data'][0]);
      //print(decode['data'][0]);
      if (response.statusCode == 200) {
        // List<dynamic> listJsonVp = (decode as Map<String, dynamic>)['data'];
        // print(listJsonVp);
        model = DashboardModel.fromJson(decode['data'][0]);

        return model;
      } else {
        return DashboardModel.withError("Api Error");
      }
    } catch (error) {
      return DashboardModel.withError(error.toString());
    }
  }
}
