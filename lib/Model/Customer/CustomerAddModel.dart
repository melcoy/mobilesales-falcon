class CustomerAddModel {
  String name;
  String alamat;
  String kota;
  String provinsi;
  String decisionmaker;
  String hp;
  String sex;
  String kelurahan;
  String kecamatan;
  String kodepos;
  String email;

  CustomerAddModel(
      {this.name,
      this.alamat,
      this.kota,
      this.provinsi,
      this.decisionmaker,
      this.hp,
      this.sex,
      this.kelurahan,
      this.kecamatan,
      this.kodepos,
      this.email});

  Map<String, dynamic> toJson() => {
        "name": name,
        "alamat": alamat,
        "kota": kota,
        "provinsi": provinsi,
        "decisionmaker": decisionmaker,
        "hp": hp,
        "sex": sex,
        "kelurahan": kelurahan,
        "kecamatan": kecamatan,
        "kodepos": kodepos,
        "email": email,
      };
}
