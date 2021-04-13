class ListVisitPlanModel {
  ListVisitPlanModel({
    this.customerid,
    this.customer,
    this.id,
    this.checkin,
    this.status,
    this.pendingreason,
    this.name,
    this.venue,
    this.tanggal,
    this.catatanpending,
    this.statusid,
  });

  int customerid;
  String customer;
  int id;
  int checkin;
  String status;
  bool pendingreason;
  String name;
  String venue;
  DateTime tanggal;
  bool catatanpending;
  int statusid;

  factory ListVisitPlanModel.fromJson(Map<String, dynamic> json) =>
      ListVisitPlanModel(
        customerid: json["customerid"],
        customer: json["customer"],
        id: json["id"],
        checkin: json["checkin"],
        status: json["status"],
        pendingreason: json["pendingreason"],
        name: json["name"],
        venue: json["venue"],
        tanggal: DateTime.parse(json["tanggal"]),
        catatanpending: json["catatanpending"],
        statusid: json["statusid"],
      );

  Map<String, dynamic> toJson() => {
        "customerid": customerid,
        "customer": customer,
        "id": id,
        "checkin": checkin,
        "status": status,
        "pendingreason": pendingreason,
        "name": name,
        "venue": venue,
        "tanggal": tanggal.toIso8601String(),
        "catatanpending": catatanpending,
        "statusid": statusid,
      };
}
