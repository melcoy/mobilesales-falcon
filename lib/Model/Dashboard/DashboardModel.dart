class DashboardModel {
  DashboardModel({
    this.targetPencapaianLocale,
    this.kunjunganBerhasil,
    this.kunjunganAktual,
    this.jadwalKunjungan,
    this.salesLocale,
    this.targetKunjungan,
    this.delta,
    this.sales,
    this.targetPencapaian,
  });

  String targetPencapaianLocale;
  String kunjunganBerhasil;
  String kunjunganAktual;
  String jadwalKunjungan;
  String salesLocale;
  String targetKunjungan;
  String delta;
  String sales;
  String targetPencapaian;

  String error;
  DashboardModel.withError(this.error);

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
        targetPencapaianLocale: json["target_pencapaian_locale"].toString(),
        kunjunganBerhasil: json["kunjungan_berhasil"].toString(),
        kunjunganAktual: json["kunjungan_aktual"].toString(),
        jadwalKunjungan: json["jadwal_kunjungan"].toString(),
        salesLocale: json["sales_locale"].toString(),
        targetKunjungan: json["target_kunjungan"].toString(),
        delta: json["delta"].toString(),
        sales: json["sales"].toString(),
        targetPencapaian: json["target_pencapaian"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "target_pencapaian_locale": targetPencapaianLocale,
        "kunjungan_berhasil": kunjunganBerhasil,
        "kunjungan_aktual": kunjunganAktual,
        "jadwal_kunjungan": jadwalKunjungan,
        "sales_locale": salesLocale,
        "target_kunjungan": targetKunjungan,
        "delta": delta,
        "sales": sales,
        "target_pencapaian": targetPencapaian,
      };
}
