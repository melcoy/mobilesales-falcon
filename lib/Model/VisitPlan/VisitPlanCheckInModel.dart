class VisitPlanCheckInModel {
  String photo;
  String latitude;
  String longitude;

  VisitPlanCheckInModel({this.photo, this.latitude, this.longitude});

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "latitude": latitude,
        "longitude": longitude,
      };
}
