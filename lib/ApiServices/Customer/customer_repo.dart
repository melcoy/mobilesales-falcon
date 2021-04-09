import 'package:salesappmobile/ApiServices/Customer/customer_provider.dart';
import 'package:salesappmobile/Model/Customer/CustomerAddModel.dart';
import 'package:salesappmobile/Model/Customer/ListCustomerModel.dart';

class CustomerRepo {
  final CustomerProvider _customerProvider = CustomerProvider();
  Future<List<ListCustomerModel>> fetchListCustomer() =>
      _customerProvider.getListCustomer();
  Future<bool> fetchAddCustomer(CustomerAddModel model) =>
      _customerProvider.addCustomer(model);
}
