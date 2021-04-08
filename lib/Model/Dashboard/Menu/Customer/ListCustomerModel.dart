class ListCustomerModel {
  int id;
  String alamat;
  String name;
  String error;

  ListCustomerModel({
    this.id,
    this.alamat,
    this.name,
  });

  ListCustomerModel.withError(this.error);

  factory ListCustomerModel.createList(Map<String, dynamic> json) =>
      ListCustomerModel(
        id: json["id"],
        alamat: json["alamat"].toString() +
            " Kota : " +
            json['kota'].toString() +
            " Kelurahan: " +
            json['kelurahan'].toString() +
            " Kecamatan: " +
            json['kecamatan'].toString(),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alamat": alamat,
        "name": name,
      };
}
