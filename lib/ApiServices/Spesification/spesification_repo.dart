import 'package:salesappmobile/ApiServices/Spesification/spesification_provider.dart';
import 'package:salesappmobile/Model/spesification/ListTruckModel.dart';

class SpesificationRepo {
  final SpesificationProvider _spesificationProvider = SpesificationProvider();

  Future<List<ListTruckModel>> fetchListSpesification() =>
      _spesificationProvider.getListSpesification();
}