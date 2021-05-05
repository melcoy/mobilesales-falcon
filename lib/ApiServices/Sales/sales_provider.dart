import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/Model/Sales/Dto/SalesInputSavedDto.dart';
import 'package:salesappmobile/Model/Sales/ListSalesModel.dart';
import 'package:salesappmobile/Util/Util.dart';

class SalesProvider {
  Future<bool> addSales(SalesInputSavedDto model) async {
    String session = await getSession();
    String id = await getIdUser();

    final queryParameters = {
      'id': id,
      'session': session,
    };

    final uri = Uri.http(host, '/api/ver1/salesman/sales/add', queryParameters);

    var body = json.encode(model.toJson());
    try {
      http.Response response =
          await http.post(uri, headers: {"apikey": apikey}, body: body);
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        print("masuk");

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

  Future<List<ListSalesModel>> getListSalesbyCust(String idCustomer) async {
    String session = await getSession();
    String id = await getIdUser();

    final queryParameters = {
      'id': id,
      'session': session,
      'customer': idCustomer,
    };
    final uri = Uri.http(
        host, '/api/ver1/salesman/sales/list/customer', queryParameters);

    List<ListSalesModel> listSales = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listJsonSales = (decode as Map<String, dynamic>)['data'];

        //print(listJsonCustomer.length);
        for (int i = 0; i < listJsonSales.length; i++) {
          listSales.add(ListSalesModel.fromJson(listJsonSales[i]));
          //print(listJsonCustomer[i]);
        }

        return listSales;
      } else {
        return listSales;
      }
    } catch (error) {
      return listSales;
    }
  }
}
