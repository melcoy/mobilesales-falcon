class ReportSalesModel {
    ReportSalesModel({
        this.targetKunjungan,
        this.targetPencapaian,
        this.kunjunganBerhasil,
        this.delta,
        this.sales,
        this.targetPencapaianLocale,
        this.jadwalKunjungan,
        this.kunjunganAktual,
        this.salesLocale,
    });

    String targetKunjungan;
    String targetPencapaian;
    String kunjunganBerhasil;
    String delta;
    String sales;
    String targetPencapaianLocale;
    String jadwalKunjungan;
    String kunjunganAktual;
    String salesLocale;

    factory ReportSalesModel.fromJson(Map<String, dynamic> json) => ReportSalesModel(
        targetKunjungan: json["target_kunjungan"].toString(),
        targetPencapaian: json["target_pencapaian"].toString(),
        kunjunganBerhasil: json["kunjungan_berhasil"].toString(),
        delta: json["delta"].toString(),
        sales: json["sales"].toString(),
        targetPencapaianLocale: json["target_pencapaian_locale"].toString(),
        jadwalKunjungan: json["jadwal_kunjungan"].toString(),
        kunjunganAktual: json["kunjungan_aktual"].toString(),
        salesLocale: json["sales_locale"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "target_kunjungan": targetKunjungan,
        "target_pencapaian": targetPencapaian,
        "kunjungan_berhasil": kunjunganBerhasil,
        "delta": delta,
        "sales": sales,
        "target_pencapaian_locale": targetPencapaianLocale,
        "jadwal_kunjungan": jadwalKunjungan,
        "kunjungan_aktual": kunjunganAktual,
        "sales_locale": salesLocale,
    };
}
