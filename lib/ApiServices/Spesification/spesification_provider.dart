import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesappmobile/Model/spesification/ListSubTypeModel.dart';
import 'package:salesappmobile/Model/spesification/ListTruckDetailModel.dart';
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
      if (response.statusCode == 200) {
        List<dynamic> listJsonTrucktype =
            (decode as Map<String, dynamic>)['data'];

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

  Future<List<ListSubTypeModel>> getListSubType(String type) async {

    final queryParameters = {
      'type': type,
    };
    final uri = Uri.http(host, '/api/ver1/product/subtype', queryParameters);

    List<ListSubTypeModel> listSubType = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});

      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listJsonSubType =
            (decode as Map<String, dynamic>)['data'];
        print(listJsonSubType);

        for (int i = 0; i < listJsonSubType.length; i++) {
          listSubType.add(ListSubTypeModel.createList(listJsonSubType[i]));
        }
      } else {
        return listSubType;
      }
    } catch (error) {
      return listSubType;
    }
    return listSubType;
  }

  Future<List<ListTruckDetailModel>> getProductDetail(String product) async {
    final queryParameters = {
      'product': product,
    };
    final uri = Uri.http(host, '/api/ver1/product/detail', queryParameters);

    List<ListTruckDetailModel> listProductDetail = [];
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});

      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        List<dynamic> listJsonSubType =
            (decode as Map<String, dynamic>)['data'];
          print('listJsonSubType');
        print(listJsonSubType);

        for (int i = 0; i < listJsonSubType.length; i++) {
          
          listProductDetail
              .add(ListTruckDetailModel.createList(listJsonSubType[i]));
          print('listProductDetail');
          print(listProductDetail);
        }
      } else {
        return listProductDetail;
      }
    } catch (error) {
      return listProductDetail;
    }
    return listProductDetail;
  }
}
