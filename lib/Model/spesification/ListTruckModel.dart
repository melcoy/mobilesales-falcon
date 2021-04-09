class ListTruckModel {
  String id;
  String name;
  String error;
  
  ListTruckModel({
    this.id,
    this.name,
  });
  
  ListTruckModel.withError(this.error);
  
  factory ListTruckModel.createList(Map<String, dynamic> json) =>
      ListTruckModel(
        id: json["id"].toString(),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}