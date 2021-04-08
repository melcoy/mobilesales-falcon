import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Customer/customer_repo.dart';
import 'package:salesappmobile/Model/Dashboard/Menu/Customer/ListCustomerModel.dart';

part 'listcustomerbloc_event.dart';
part 'listcustomerbloc_state.dart';

class ListcustomerblocBloc
    extends Bloc<ListcustomerblocEvent, ListcustomerblocState> {
  CustomerRepo _customerRepo = CustomerRepo();

  ListcustomerblocBloc() : super(ListcustomerblocInitial());

  @override
  Stream<ListcustomerblocState> mapEventToState(
    ListcustomerblocEvent event,
  ) async* {
    yield ListcustomerblocLoading();
    List<ListCustomerModel> listCustomer =
        await _customerRepo.fetchListCustomer();

    if (event is ListcustomerblocEventStarted) {
      if (listCustomer.isEmpty) {
        yield ListcustomerblocFailure("Customer Null");
      } else {
        yield ListcustomerblocLoaded(listCustomer);
      }
    }
    if (event is ListcustomerblocEventSearch) {
      if (listCustomer.isEmpty) {
        yield ListcustomerblocFailure("Customer Null");
      } else {
        List<ListCustomerModel> listCustomerSearch = [];

        for (int i = 0; i < listCustomer.length; i++) {
          if (listCustomer[i]
              .name
              .toLowerCase()
              .contains(event.searchText.toLowerCase())) {
            listCustomerSearch.add(listCustomer[i]);
          }
        }
        yield ListcustomerblocLoaded(listCustomerSearch);
      }
    }
  }
}
