class ListCustomerModel {
  int id;
  String alamat;
  String name;
  String kodepos;
  String email;
  String hp;
  String sex;
  String kelurahan;
  String provinsi;
  String kecamatan;
  String photo;
  String kota;
  String dm;
  String error;

  ListCustomerModel({
    this.id,
    this.alamat,
    this.name,
    this.kodepos,
    this.email,
    this.hp,
    this.sex,
    this.kelurahan,
    this.provinsi,
    this.kecamatan,
    this.photo,
    this.kota,
    this.dm,
  });

  ListCustomerModel.withError(this.error);

  factory ListCustomerModel.createList(Map<String, dynamic> json) =>
      ListCustomerModel(
        id: json["id"],
        alamat: json["alamat"].toString(),
        name: json["name"],
        kodepos: json["kodepos"],
        email: json["email"],
        hp: json["hp"],
        sex: json["sex"],
        kelurahan: json["kelurahan"],
        provinsi: json["provinsi"],
        kecamatan: json["kecamatan"],
        photo: json["photo"],
        kota: json["kota"],
        dm: json["dm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alamat": alamat,
        "name": name,
      };
}
