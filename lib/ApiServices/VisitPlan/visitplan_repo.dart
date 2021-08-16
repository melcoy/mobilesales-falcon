import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_provider.dart';
import 'package:salesappmobile/Model/VisitPlan/ListVisitPlanModel.dart';
import 'package:salesappmobile/Model/VisitPlan/VisitPlanAddModel.dart';
import 'package:salesappmobile/Model/VisitPlan/VisitPlanCheckInModel.dart';

class VisitPlanRepo {
  final VisitPlanProvider _visitPlanProvider = VisitPlanProvider();

  Future<List<ListVisitPlanModel>> fetchListVp(
          String dateStart, String dateEnd) =>
      _visitPlanProvider.getListVp(dateStart, dateEnd);
  Future<bool> fetchAddVisitPlan(VisitPlanAddModel model) =>
      _visitPlanProvider.addVisitPlan(model);
  Future<bool> fetchcheckInVisitPlan(
          VisitPlanCheckInModel model, String idVisitPlan) =>
      _visitPlanProvider.checkInVisitPlan(model, idVisitPlan);

  Future<List<dynamic>> fetchgetStatusVisitPlan() =>
      _visitPlanProvider.getStatusVisitPlan();

  Future<List<dynamic>> fetchPendingReasonVisitPlan() =>
      _visitPlanProvider.getPendingReasonVisitPlan();

  Future<bool> fetchUpdateStatusVisitPlan(String status, String visitPlanId) =>
      _visitPlanProvider.updateStatusVisitPlan(status, visitPlanId);

  Future<bool> fetchMarkPendingReason(
          String status, String visitPlanId, String pendingNote) =>
      _visitPlanProvider.markPendingReason(status, visitPlanId, pendingNote);
  Future<bool> fetchCheckout(String lat, String long, String visitPlanId) =>
      _visitPlanProvider.checkout(long, lat, visitPlanId);
}
