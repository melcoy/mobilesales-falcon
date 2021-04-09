class ProvinsiModel {
  String id;
  String name;

  ProvinsiModel({this.id, this.name});

  factory ProvinsiModel.createProv(Map<String, dynamic> json) =>
      ProvinsiModel(id: json["id"].toString(), name: json["name"].toString());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
