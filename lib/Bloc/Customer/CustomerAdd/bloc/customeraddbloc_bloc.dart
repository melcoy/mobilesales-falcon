import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/Customer/customer_repo.dart';

import 'package:salesappmobile/Model/Customer/CustomerAddModel.dart';

import 'package:salesappmobile/Model/Customer/Dto/CustomerAddDto.dart';
import 'package:salesappmobile/Util/Connection.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'customeraddbloc_event.dart';
part 'customeraddbloc_state.dart';

class CustomeraddblocBloc
    extends Bloc<CustomeraddblocEvent, CustomeraddblocState> {
  CustomeraddblocBloc() : super(CustomeraddblocInitial());
  CustomerRepo _customerRepo = CustomerRepo();
  // MasterRepo _masterRepo = MasterRepo();
  final Connection checkConnection = Connection();

  @override
  Stream<CustomeraddblocState> mapEventToState(
    CustomeraddblocEvent event,
  ) async* {
    // if (event is CustomeraddblocEventStart) {
    //   yield CustomeraddblocMasterLoading();
    //   bool connect = await checkConnection.initConnectivity();
    //   if (connect == false) {
    //     yield CustomeraddblocFailure(errorMsg: noInternet);
    //   } else {
    //     List<dynamic> listKota = await _masterRepo.fetchListKota();
    //     List<dynamic> listProvinsi = await _masterRepo.fetchListProv();
    //     if (listKota.isEmpty && listProvinsi.isEmpty) {
    //       yield CustomeraddblocMasterFailure(errorMsg: "Error Kota, Provinsi");
    //       return;
    //     } else {
    //       yield CustomeraddblocMasterLoaded(
    //           kotaModel: listKota, provinsiModel: listProvinsi);
    //     }
    //   }
    // }

    if (event is CustomeraddblocEventSave) {
      bool connect = await checkConnection.initConnectivity();
      if (connect == false) {
        yield CustomeraddblocFailure(errorMsg: noInternet);
      } else {
        yield CustomeraddblocLoading();
        String sex;
        if (event.model.sex.contains("Men")) {
          sex = "P";
        } else {
          sex = "W";
        }
        CustomerAddModel model = new CustomerAddModel(
            name: event.model.name,
            alamat: event.model.alamat,
            decisionmaker: "1",
            email: "",
            hp: "",
            kecamatan: "",
            kelurahan: "",
            kodepos: "",
            kota: event.model.kota,
            provinsi: event.model.provinsi,
            sex: sex);

        bool saved = await _customerRepo.fetchAddCustomer(model);

        if (saved == false) {
          yield CustomeraddblocFailure(
              errorMsg: "Failed Created Customer, Try Again");
        } else {
          yield CustomeraddblocSuccess(msg: "Data has been saved");
        }
      }
    }
  }
}
