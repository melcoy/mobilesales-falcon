import 'package:salesappmobile/ApiServices/Sales/sales_provider.dart';
import 'package:salesappmobile/Model/Sales/Dto/SalesInputSavedDto.dart';
import 'package:salesappmobile/Model/Sales/ListSalesModel.dart';

class SalesRepo {
  final SalesProvider _salesProvider = SalesProvider();

  Future<bool> fetchSales(SalesInputSavedDto model) =>
      _salesProvider.addSales(model);

  Future<List<ListSalesModel>> fetchetListSalesbyCust(String idCust) =>
      _salesProvider.getListSalesbyCust(idCust);
}
