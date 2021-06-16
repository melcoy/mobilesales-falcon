import 'package:salesappmobile/Model/Master/KotaModel.dart';
import 'package:salesappmobile/Model/Master/ProvinsiModel.dart';
import 'package:salesappmobile/Util/Util.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MasterProvider {
  Future<List<dynamic>> getListKota() async {
    final uri = Uri.http(host, '/api/ver1/kota');

    List<dynamic> listJsonKota;
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);

      if (response.statusCode == 200) {
        //listJsonKota = (decode as Map<String, dynamic>)['data'];
        listJsonKota = decode['data'];
        // for (int i = 0; i < listJsonKota.length; i++)
        //   listKota.add(KotaModel.createCity(listJsonKota[i]));

        return listJsonKota;
      } else {
        return listJsonKota;
      }
    } catch (error) {
      print("Error" + error);
      return listJsonKota;
    }
  }

  Future<List<dynamic>> getListProv() async {
    final uri = Uri.http(host, '/api/ver1/provinsi');

    //List<ProvinsiModel> listProv = [];
    List<dynamic> listJsonProv;
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        // listJsonProv = (decode as Map<String, dynamic>)['data'];
        listJsonProv = decode['data'];

        // for (int i = 0; i < listJsonProv.length; i++)
        //   listProv.add(ProvinsiModel.createProv(listJsonProv[i]));

        return listJsonProv;
      } else {
        return listJsonProv;
      }
    } catch (error) {
      print("Error Prov" + error.toString());
      return listJsonProv;
    }
  }

  static Future<List<ProvinsiModel>> getSuggestionProv(String query) async {
    final uri = Uri.http(host, '/api/ver1/provinsi');

    //List<ProvinsiModel> listProv = [];
    List<dynamic> listJsonProv;
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        // listJsonProv = (decode as Map<String, dynamic>)['data'];
        listJsonProv = decode['data'];

        return listJsonProv
            .map((e) => ProvinsiModel.createProv(e))
            .where((element) {
          final nameLower = element.name.toLowerCase();
          final queryLower = query.toLowerCase();
          return nameLower.contains(queryLower);
        }).toList();

        // for (int i = 0; i < listJsonProv.length; i++)
        //   listProv.add(ProvinsiModel.createProv(listJsonProv[i]));

      } else {
        throw Exception();
      }
    } catch (error) {
      print("Error Prov" + error.toString());
      return error;
    }
  }

  static Future<List<KotaModel>> getSuggestionCity(String query) async {
    final uri = Uri.http(host, '/api/ver1/kota');

    List<dynamic> listJsonCity;
    try {
      http.Response response = await http.get(uri, headers: {"apikey": apikey});
      var decode = json.decode(response.body);
      if (response.statusCode == 200) {
        // listJsonProv = (decode as Map<String, dynamic>)['data'];
        listJsonCity = decode['data'];

        return listJsonCity
            .map((e) => KotaModel.createCity(e))
            .where((element) {
          final nameLower = element.name.toLowerCase();
          final queryLower = query.toLowerCase();
          return nameLower.contains(queryLower);
        }).toList();

        // for (int i = 0; i < listJsonProv.length; i++)
        //   listProv.add(ProvinsiModel.createProv(listJsonProv[i]));

      } else {
        throw Exception();
      }
    } catch (error) {
      print("Error Prov" + error.toString());
      return error;
    }
  }
}
