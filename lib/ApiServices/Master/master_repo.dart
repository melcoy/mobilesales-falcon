import 'master_provider.dart';

class MasterRepo {
  final MasterProvider _masterProvider = MasterProvider();
  Future<List<dynamic>> fetchListKota() => _masterProvider.getListKota();

  Future<List<dynamic>> fetchListProv() => _masterProvider.getListProv();
}
