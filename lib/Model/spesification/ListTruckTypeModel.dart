class ListTruckTypeModel {
  String id;
  String name;
  String category;
  String categoryid;
  String error;
  
  ListTruckTypeModel({
    this.id,
    this.name,
    this.category,
    this.categoryid,
  });
  
  ListTruckTypeModel.withError(this.error);
  
  factory ListTruckTypeModel.createList(Map<String, dynamic> json) =>
      ListTruckTypeModel(
        id: json["id"].toString(),
        name: json["name"],
        category: json["category"],
        categoryid: json["categoryid"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}