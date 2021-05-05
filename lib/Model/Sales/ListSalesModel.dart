class ListSalesModel {
  ListSalesModel({
    this.tipebayar,
    this.quantity,
    this.raihan,
    this.produkid,
    this.customeraddress,
    this.tanggal,
    this.visited,
    this.customer,
    this.produk,
    this.visitplanid,
    this.customerid,
    this.bonus,
    this.number,
    this.discount,
    this.bonustambahan,
    this.id,
  });

  String tipebayar;
  String quantity;
  String raihan;
  String produkid;
  String customeraddress;
  String tanggal;
  String visited;
  String customer;
  String produk;
  String visitplanid;
  String customerid;
  List<Bonus> bonus;
  String number;
  String discount;
  String bonustambahan;
  String id;

  factory ListSalesModel.fromJson(Map<String, dynamic> json) => ListSalesModel(
        tipebayar: json["tipebayar"].toString(),
        quantity: json["quantity"].toString(),
        raihan: json["raihan"].toString(),
        produkid: json["produkid"].toString(),
        customeraddress: json["customeraddress"],
        tanggal: DateTime.parse(json["tanggal"]).toLocal().toString(),
        visited: DateTime.parse(json["visited"]).toLocal().toString(),
        customer: json["customer"].toString(),
        produk: json["produk"].toString(),
        visitplanid: json["visitplanid"].toString(),
        customerid: json["customerid"].toString(),
        bonus: List<Bonus>.from(json["bonus"].map((x) => Bonus.fromJson(x))),
        number: json["number"].toString(),
        discount: json["discount"].toDouble().toString(),
        bonustambahan: json["bonustambahan"].toString(),
        id: json["id"].toString(),
      );

  // Map<String, dynamic> toJson() => {
  //     "tipebayar": tipebayar,
  //     "quantity": quantity,
  //     "raihan": raihan,
  //     "produkid": produkid,
  //     "customeraddress": customeraddress,
  //     "tanggal": tanggal.toIso8601String(),
  //     "visited": visited.toIso8601String(),
  //     "customer": customer,
  //     "produk": produk,
  //     "visitplanid": visitplanid,
  //     "customerid": customerid,
  //     "bonus": List<dynamic>.from(bonus.map((x) => x.toJson())),
  //     "number": number,
  //     "discount": discount,
  //     "bonustambahan": bonustambahan,
  //     "id": id,
  // };
}

class Bonus {
  Bonus({
    this.name,
  });

  String name;

  factory Bonus.fromJson(Map<String, dynamic> json) => Bonus(
        name: json["name"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
