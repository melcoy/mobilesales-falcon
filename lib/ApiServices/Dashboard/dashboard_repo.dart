import 'package:salesappmobile/Model/Dashboard/DashboardModel.dart';
import 'package:salesappmobile/Model/Dashboard/DashboardTotalSalesModel.dart';

import 'dahsboard_provider.dart';

class DashboardRepo {
  final DashboardProvider _dashboardProvider = DashboardProvider();
  Future<DashboardModel> fetchDashboardData(String dateStart, String dateEnd) =>
      _dashboardProvider.getDashboardData(dateStart, dateEnd);
      
  Future<List<DashboardTotalSalesModel>> fetchTotalReportSales() =>
      _dashboardProvider.getTotalReportSales();
}
