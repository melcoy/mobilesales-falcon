import 'package:salesappmobile/Model/VisitPlan/ListVisitPlanModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/Model/VisitPlan/VisitPlanAddModel.dart';
import 'package:salesappmobile/Model/VisitPlan/VisitPlanCheckInModel.dart';
import 'package:salesappmobile/Util/Connection.dart';
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
        List<dynamic> listJsonVp = (decode as Map<String, dynamic>)['data'];
        for (int i = 0; i < listJsonVp.length; i++) {
          listVp.add(ListVisitPlanModel.fromJson(listJsonVp[i]));
        }

        return listVp;
      } else {
        return listVp;
      }
    } catch (error) {
      return listVp;
    }
  }

//////////////////////////////////////////////////////////////////////////////////////
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

  ///////////////////////////////////////////////////////////
  Future<bool> checkInVisitPlan(
      VisitPlanCheckInModel model, String idVisitPlan) async {
    String session = await getSession();
    String id = await getIdUser();
    print("ID:" + idVisitPlan);
    print("LAT: " + model.latitude);
    final queryParameters = {
      'id': id,
      'session': session,
      'visitplan': idVisitPlan
    };

    final uri =
        Uri.http(host, '/api/ver1/salesman/visitplan/checkin', queryParameters);

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

//////////VisitPlanPending//////////////////////////////////////
  Future<List<dynamic>> getStatusVisitPlan() async {
    final uri = Uri.http(host, '/api/ver1/visitplan/status');
    List<dynamic> listJsonVP = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        listJsonVP = decode['data'];

        return listJsonVP;
      } else {
        return listJsonVP;
      }
    } catch (error) {
      print("try" + error.toString());
      return listJsonVP;
    }
  }

  Future<List<dynamic>> getPendingReasonVisitPlan() async {
    final uri = Uri.http(host, '/api/ver1/visitplan/pendingreason');
    List<dynamic> listJsonReasonVP = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        listJsonReasonVP = decode['data'];

        return listJsonReasonVP;
      } else {
        return listJsonReasonVP;
      }
    } catch (error) {
      print("try" + error.toString());
      return listJsonReasonVP;
    }
  }

  Future<bool> updateStatusVisitPlan(String status, String visitPlanId) async {
    String session = await getSession();
    String id = await getIdUser();

    final queryParameters = {
      'id': id,
      'session': session,
      'visitplan': visitPlanId
    };
    final uri = Uri.http(
        host, '/api/ver1/salesman/visitplan/update/status', queryParameters);

    Map credential = {'status': status};
    try {
      var body = json.encode(credential);
      http.Response response =
          await http.post(uri, headers: {"apikey": apikey}, body: body);
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        print(decode.toString());
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("try" + error.toString());
      return false;
    }
  }

  Future<bool> markPendingReason(
      String statusPending, String visitPlanId, String pendingNote) async {
    String session = await getSession();
    String id = await getIdUser();

    final queryParameters = {
      'id': id,
      'session': session,
      'visitplan': visitPlanId
    };
    final uri = Uri.http(
        host, '/api/ver1/salesman/visitplan/update/pending', queryParameters);

    Map credential = {'pending': statusPending, 'pendingnote': pendingNote};
    try {
      var body = json.encode(credential);
      http.Response response =
          await http.post(uri, headers: {"apikey": apikey}, body: body);
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        print(decode.toString());
        return true;
      } else {
        return false;
      }
    } catch (error) {
      print("try" + error.toString());
      return false;
    }
  }

  ///////////////////////////////////////////////////////////////////////

  Future<bool> checkout(
    String long,
    String lat,
    String visitPlanId,
  ) async {
    String session = await getSession();
    String id = await getIdUser();
    final Connection checkConnection = Connection();
    final queryParameters = {
      'id': id,
      'session': session,
      'visitplan': visitPlanId
    };

    final uri = Uri.http(
        host, '/api/ver1/salesman/visitplan/checkout', queryParameters);
    Map credential = {'latitude': long, 'longitude': lat};
    var body = json.encode(credential);
    try {
      bool connect = await checkConnection.initConnectivity();

      if (connect) {
        http.Response response =
            await http.post(uri, headers: {"apikey": apikey}, body: body);
        var decode = json.decode(response.body);
        if (response.statusCode == 200 && decode['status'].toString() == "1") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
