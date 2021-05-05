class ReportTotalSalesModel {
    ReportTotalSalesModel({
        this.totalPenjualan,
        this.totalPenjualanLocale,
    });

    String totalPenjualan;
    String totalPenjualanLocale;

    factory ReportTotalSalesModel.fromJson(Map<String, dynamic> json) => ReportTotalSalesModel(
        totalPenjualan: json["total_penjualan"].toString(),
        totalPenjualanLocale: json["total_penjualan_locale"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "total_penjualan": totalPenjualan,
        "total_penjualan_locale": totalPenjualanLocale,
    };
}
