class VisitPlanAddModel {
  String tanggal;
  String customer;
  String venue;

  VisitPlanAddModel({this.tanggal, this.customer, this.venue});

  Map<String, dynamic> toJson() => {
        "tanggal": tanggal,
        "customer": customer,
        "venue": venue,
      };
}
