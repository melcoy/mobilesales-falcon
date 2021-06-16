import 'package:salesappmobile/Model/Customer/CustomerAddModel.dart';
import 'package:salesappmobile/Model/Customer/ListCustomerModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

        //print(listJsonCustomer.length);
        for (int i = 0; i < listJsonCustomer.length; i++) {
          listCustomer.add(ListCustomerModel.createList(listJsonCustomer[i]));
          print(listCustomer[i]);
        }

        return listCustomer;
      } else {
        return listCustomer;
      }
    } catch (error) {
      return listCustomer;
    }
  }

  Future<bool> addCustomer(CustomerAddModel model) async {
    String session = await getSession();
    String id = await getIdUser();
    // CustomerAddModel model1 = new CustomerAddModel(
    //     name: "Udin",
    //     alamat: "Jln.Pandu",
    //     decisionmaker: "1",
    //     email: "Udin@Udin",
    //     hp: "0000000",
    //     kecamatan: "Bojong",
    //     kelurahan: "Bojong",
    //     kodepos: "4444",
    //     kota: "187",
    //     provinsi: "97",
    //     sex: "P");

    print("Model Customer :" + model.kota);
    final queryParameters = {
      'id': id,
      'session': session,
    };

    final uri =
        Uri.http(host, '/api/ver1/salesman/customer/add', queryParameters);

    var body = json.encode(model.toJson());
    try {
      http.Response response =
          await http.post(uri, headers: {"apikey": apikey}, body: body);
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        print("masuk");
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
