import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_repo.dart';
import 'package:salesappmobile/Model/VisitPlan/VisitPlanCheckInModel.dart';
import 'package:salesappmobile/Util/CloudinaryUpload.dart';
import 'package:salesappmobile/Util/Connection.dart';
import 'package:salesappmobile/Util/GetLocation.dart';
import 'package:salesappmobile/Util/Util.dart';

part 'visitplancheckinbloc_event.dart';
part 'visitplancheckinbloc_state.dart';

class VisitplancheckinblocBloc
    extends Bloc<VisitplancheckinblocEvent, VisitplancheckinblocState> {
  VisitplancheckinblocBloc() : super(VisitplancheckinblocInitial());

  final VisitPlanRepo _visitPlanRepo = VisitPlanRepo();
  final CloudinaryUpload _cloudinaryUpload = CloudinaryUpload();
  final Connection checkConnection = Connection();
  final GetLocation _getLocation = GetLocation();

  @override
  Stream<VisitplancheckinblocState> mapEventToState(
    VisitplancheckinblocEvent event,
  ) async* {
    if (event is VisitplancheckinblocEventCapture) {
      yield VisitplancheckinblocLoading();
      bool connect = await checkConnection.initConnectivity();
      if (connect == false) {
        yield VisitplancheckinblocFaillure(errMsg: noInternet);
      } else {
        yield VisitplancheckinblocLoading();
        String url = await _cloudinaryUpload.uploadToCloudinary(event.path);
        var loc = await _getLocation.getLocation();
        if (url == null || loc == null) {
          yield VisitplancheckinblocFaillure(errMsg: "Failed");
        } else {
          bool saved = await _visitPlanRepo.fetchcheckInVisitPlan(
              VisitPlanCheckInModel(
                  photo: url, latitude: loc[0], longitude: loc[1]),
              event.visitId);
          if (saved == true) {
            yield VisitplancheckinblocSuccess(succMsg: "Data Saved");
          } else {
            yield VisitplancheckinblocFaillure(errMsg: "Failed");
          }
        }
      }
    }
  }
}
