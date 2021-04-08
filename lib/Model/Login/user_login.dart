class UserLogin {
  String cabang;
  String pusat;
  String session;
  String subCabang;

  String id;
  String error;

  UserLogin({this.cabang, this.pusat, this.session, this.subCabang, this.id});
  UserLogin.withError(this.error);

  factory UserLogin.loginUser(Map<String, dynamic> object) {
    return UserLogin(
        id: object["id"].toString(),
        pusat: object["pusat"].toString(),
        session: object["session"].toString(),
        subCabang: object["subcabang"].toString(),
        cabang: object['cabang'].toString());
  }
}
