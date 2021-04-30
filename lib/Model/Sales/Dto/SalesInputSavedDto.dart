class SalesInputSavedDto {
  SalesInputSavedDto({
    this.visitplan,
    this.produk,
    this.tipebayar,
    this.quantity,
    this.discount,
    this.hargaterjual,
    this.bonustambahan,
  });

  int visitplan;
  int produk;
  int tipebayar;
  int quantity;
  double discount;
  int hargaterjual;
  String bonustambahan;

  factory SalesInputSavedDto.fromJson(Map<String, dynamic> json) =>
      SalesInputSavedDto(
        visitplan: json["visitplan"],
        produk: json["produk"],
        tipebayar: json["tipebayar"],
        quantity: json["quantity"],
        discount: json["discount"].toDouble(),
        hargaterjual: json["hargaterjual"],
        bonustambahan: json["bonustambahan"],
      );

  Map<String, dynamic> toJson() => {
        "visitplan": visitplan,
        "produk": produk,
        "tipebayar": tipebayar,
        "quantity": quantity,
        "discount": discount,
        "hargaterjual": hargaterjual,
        "bonustambahan": bonustambahan,
      };
}
