class DashboardTotalSalesModel {
    DashboardTotalSalesModel({
        this.totalPenjualan,
        this.totalPenjualanLocale,
    });

    String totalPenjualan;
    String totalPenjualanLocale;

    factory DashboardTotalSalesModel.fromJson(Map<String, dynamic> json) => DashboardTotalSalesModel(
        totalPenjualan: json["total_penjualan"].toString(),
        totalPenjualanLocale: json["total_penjualan_locale"].toString(),
    );

    Map<String, dynamic> toJson() => {
        "total_penjualan": totalPenjualan,
        "total_penjualan_locale": totalPenjualanLocale,
    };
}
