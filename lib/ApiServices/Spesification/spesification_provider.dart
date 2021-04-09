import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/Model/spesification/ListTruckModel.dart';
import 'package:salesappmobile/Model/spesification/ListTruckTypeModel.dart';
import 'package:salesappmobile/Util/Util.dart';

class SpesificationProvider {
  Future<List<ListTruckModel>> getListSpesification() async {
    final uri = Uri.http(host, '/api/ver1/product/category');

    List<ListTruckModel> listSpesification = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listJsonSpesification =
            (decode as Map<String, dynamic>)['data'];
        print(listJsonSpesification);

        for (int i = 0; i < listJsonSpesification.length; i++) {
          listSpesification
              .add(ListTruckModel.createList(listJsonSpesification[i]));
        }
      } else {
        return listSpesification;
      }
    } catch (error) {
      return listSpesification;
    }
    return listSpesification;
  }

  Future<List<ListTruckTypeModel>> getListTruckType(String category) async {
    String idPusat = await getIdPusat();
    
    final queryParameters = {
      'pusat': idPusat,
      'category': category,
    };
    final uri = Uri.http(host, '/api/ver1/product/type', queryParameters);

    List<ListTruckTypeModel> listTruckType = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});

      var decode = json.decode(response.body);
      // print(response.statusCode);
      if (response.statusCode == 200) {
        List<dynamic> listJsonTrucktype =
            (decode as Map<String, dynamic>)['data'];
        print(listJsonTrucktype);

        for (int i = 0; i < listJsonTrucktype.length; i++) {
          listTruckType
              .add(ListTruckTypeModel.createList(listJsonTrucktype[i]));
        }
      } else {
        return listTruckType;
      }
    } catch (error) {
      return listTruckType;
    }
    return listTruckType;
  }
}
