class SalesInputSavedDto {
  SalesInputSavedDto({
    this.visitplan,
    this.idProduk,
    this.tipebayar,
    this.quantity,
    this.discount,
    this.hargaterjual,
    this.bonustambahan,
  });

  String visitplan;
  String idProduk;
  String tipebayar;
  String quantity;
  String discount;
  String hargaterjual;
  String bonustambahan;

  Map<String, dynamic> toJson() => {
        "visitplan": visitplan,
        "produk": idProduk,
        "tipebayar": tipebayar,
        "quantity": quantity,
        "discount": discount,
        "hargaterjual": hargaterjual,
        "bonustambahan": bonustambahan,
      };
}
