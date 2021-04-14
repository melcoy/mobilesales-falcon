import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Spesification/spesification_repo.dart';
import 'package:salesappmobile/Model/spesification/Dto/ListTruckDetailDTO.dart';
import 'package:salesappmobile/Model/spesification/ListTruckDetailModel.dart';

part 'listproductdetailbloc_event.dart';
part 'listproductdetailbloc_state.dart';

class ListproductdetailblocBloc
    extends Bloc<ListproductdetailblocEvent, ListproductdetailblocState> {
  SpesificationRepo _spesificationRepo = SpesificationRepo();

  ListproductdetailblocBloc() : super(ListproductdetailblocInitial());

  @override
  Stream<ListproductdetailblocState> mapEventToState(
    ListproductdetailblocEvent event,
  ) async* {
    if (event is ListproductdetailblocEventStarted) {
      yield ListproductdetailblocLoading();
      List<ListTruckDetailModel> listTruckDetail =
          await _spesificationRepo.getProductDetail(event.id);
          List<ListTruckDetailDTO> listTruckDetailDTO = [];
          String pembayaran;
          for(int i =0; i < listTruckDetail.length; i++){
            print(listTruckDetail[i].pembayaran);
          if(listTruckDetail[i].pembayaran == '10'){
            pembayaran = 'Cash';
          }
          else{
            pembayaran = 'Kredit';
          
          }
            listTruckDetailDTO.add(ListTruckDetailDTO(pembayaran: pembayaran, harga: listTruckDetail[i].harga, name: listTruckDetail[i].name));
          }
      if (listTruckDetail.isEmpty) {
        yield ListproductdetailblocFailure("Truck Null");
      } else {
        yield ListproductdetailblocLoaded(listTruckDetailDTO);
      }
    }
  }
}