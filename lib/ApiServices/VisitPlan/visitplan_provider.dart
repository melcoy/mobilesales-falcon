import 'package:salesappmobile/Model/VisitPlan/ListVisitPlanModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/Model/VisitPlan/VisitPlanAddModel.dart';
import 'package:salesappmobile/Util/Util.dart';

class VisitPlanProvider {
  Future<List<ListVisitPlanModel>> getListVp(
      String dateStart, String dateEnd) async {
    String session = await getSession();
    String id = await getIdUser();

    final queryParameters = {
      'id': id,
      'session': session,
      'start': dateStart,
      'end': dateEnd
    };
    final uri =
        Uri.http(host, '/api/ver1/salesman/visitplan/list', queryParameters);

    List<ListVisitPlanModel> listVp = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listJsonCustomer =
            (decode as Map<String, dynamic>)['data'];

        for (int i = 0; i < listJsonCustomer.length; i++)
          listVp.add(ListVisitPlanModel.fromJson(listJsonCustomer[i]));

        return listVp;
      } else {
        return listVp;
      }
    } catch (error) {
      return listVp;
    }
  }

  Future<bool> addVisitPlan(VisitPlanAddModel model) async {
    String session = await getSession();
    String id = await getIdUser();

    final queryParameters = {
      'id': id,
      'session': session,
    };

    final uri =
        Uri.http(host, 'api/ver1/salesman/visitplan/add', queryParameters);

    var body = json.encode(model.toJson());
    try {
      http.Response response =
          await http.post(uri, headers: {"apikey": apikey}, body: body);
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        //List<dynamic> listResponse = (decode as Map<String, dynamic>)['data'];
        print(decode.toString());
        return true;
      } else {
        print(response.toString());
        return false;
      }
    } catch (error) {
      print("try" + error.toString());
      return false;
    }
  }
}
