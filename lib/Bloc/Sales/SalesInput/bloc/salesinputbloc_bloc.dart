import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Sales/sales_repo.dart';
import 'package:salesappmobile/ApiServices/Spesification/spesification_repo.dart';
import 'package:salesappmobile/Model/Sales/Dto/SalesInputSavedDto.dart';
import 'package:salesappmobile/Model/spesification/ListAllTruckModel.dart';
import 'package:salesappmobile/Util/Connection.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'salesinputbloc_event.dart';
part 'salesinputbloc_state.dart';

class SalesinputblocBloc
    extends Bloc<SalesinputblocEvent, SalesinputblocState> {
  SalesinputblocBloc() : super(SalesinputblocInitial());
  final Connection checkConnection = Connection();
  final SpesificationRepo _spesificationRepo = SpesificationRepo();
  final SalesRepo _salesRepo = SalesRepo();
  @override
  Stream<SalesinputblocState> mapEventToState(
    SalesinputblocEvent event,
  ) async* {
    bool connect = await checkConnection.initConnectivity();
    yield SalesinputblocLoading();
    if (connect == false) {
      yield SalesinputblocFailure(errMsg: noInternet);
    } else {
      yield SalesinputblocLoading();
      List<ListAllTruckModel> listAllProduct;

      listAllProduct = await _spesificationRepo.fetchAllProductDetail();
      if (event is SaleSalesinputblocEventStarted) {
        if (listAllProduct != null) {
          yield SalesinputblocLoaded(listAllProduct: listAllProduct);
        } else {
          yield SalesinputblocFailure(errMsg: "Null");
        }
      }

      if (event is SaleSalesinputblocEventSearch) {
        yield SalesinputblocLoading();
        List<ListAllTruckModel> listAllProductSearch = [];

        listAllProduct = await _spesificationRepo.fetchAllProductDetail();

        for (int i = 0; i < listAllProduct.length; i++) {
          if (listAllProduct[i]
              .name
              .toLowerCase()
              .contains(event.searchProduct.toLowerCase())) {
            listAllProductSearch.add(listAllProduct[i]);
          }
        }
        if (listAllProduct != null) {
          yield SalesinputblocLoaded(listAllProduct: listAllProductSearch);
        } else {
          yield SalesinputblocFailure(errMsg: "Null");
        }
      }

      if (event is SaleSalesinputblocEventSaved) {
        yield SalesinputblocLoading();
        bool saved = await _salesRepo.fetchSales(event.model);

        if (saved == false) {
          yield SalesinputblocFailure(
              errMsg: "Sales Input Failed, Please Try Again Later");
        } else {
          yield SalesinputblocSaved(savedMsg: "Sales has succesfully added");
        }
      }
    }
  }
}
