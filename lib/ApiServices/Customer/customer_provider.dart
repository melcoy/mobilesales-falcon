import 'package:salesappmobile/Model/Dashboard/Menu/Customer/CustomerAddModel.dart';
import 'package:salesappmobile/Model/Dashboard/Menu/Customer/ListCustomerModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/View/Dashboard/Menu/Customer/ListCustomer.dart';

class CustomerProvider {
  Future<List<ListCustomerModel>> getListCustomer() async {
    String session = await getSession();
    String id = await getIdUser();

    final queryParameters = {
      'id': id,
      'session': session,
    };
    final uri =
        Uri.http(host, '/api/ver1/salesman/customer/list', queryParameters);

    List<ListCustomerModel> listCustomer = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listJsonCustomer =
            (decode as Map<String, dynamic>)['data'];

        for (int i = 0; i < listJsonCustomer.length; i++)
          listCustomer.add(ListCustomerModel.createList(listJsonCustomer[i]));
      } else {
        return listCustomer;
      }
    } catch (error) {
      return listCustomer;
    }

    return listCustomer;
  }

  Future<bool> addCustomer(CustomerAddModel model) async {
    String session = await getSession();
    String id = await getIdUser();
  }
}
