import 'package:salesappmobile/ApiServices/Spesification/spesification_provider.dart';
import 'package:salesappmobile/Model/spesification/ListTruckModel.dart';
import 'package:salesappmobile/Model/spesification/ListTruckTypeModel.dart';

class SpesificationRepo {
  final SpesificationProvider _spesificationProvider = SpesificationProvider();

  Future<List<ListTruckModel>> fetchListSpesification() =>
      _spesificationProvider.getListSpesification();
      
  Future<List<ListTruckTypeModel>> fetchListTruckType(String category) =>
      _spesificationProvider.getListTruckType(category);
}