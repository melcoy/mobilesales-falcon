import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/Model/spesification/ListTruckModel.dart';
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
}
