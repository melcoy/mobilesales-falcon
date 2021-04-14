class ListSubTypeModel {
  String id;
  String name;
  String error;
  
  ListSubTypeModel({
    this.id,
    this.name,
  });
  
  ListSubTypeModel.withError(this.error);
  
  factory ListSubTypeModel.createList(Map<String, dynamic> json) =>
      ListSubTypeModel(
        id: json["id"].toString(),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}