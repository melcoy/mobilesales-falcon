import 'dart:convert';

class VisitPlanMenuModel {
  String id;
  String nama;
  String alamat;
  String noTelp;

  VisitPlanMenuModel(
      {this.id, this.nama = "", this.alamat = "", this.noTelp = ""});

  static get http => null;

  static Future<List<VisitPlanMenuModel>> getListVP(
      int start, int limit) async {
    String apiURL = "https://jsonplaceholder.typicode.com/posts?_start=" +
        start.toString() +
        "&_limit=" +
        limit.toString();

    var apiResult = await http.get(apiURL);
    var jsonObject = json.decode(apiResult.body) as List;

    return jsonObject
        .map<VisitPlanMenuModel>((item) => VisitPlanMenuModel(
            id: item["id"].toString(),
            alamat: item["title"],
            noTelp: item["body"]))
        .toList();
  }
}
