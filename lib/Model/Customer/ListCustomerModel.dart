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
        name: json["name"].toString(),
        kodepos: json["kodepos"].toString(),
        email: json["email"].toString(),
        hp: json["hp"].toString(),
        sex: json["sex"].toString(),
        kelurahan: json["kelurahan"].toString(),
        provinsi: json["provinsi"].toString(),
        kecamatan: json["kecamatan"].toString(),
        photo: json["photo"].toString(),
        kota: json["kota"].toString(),
        dm: json["dm"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "alamat": alamat,
        "name": name,
      };
}
