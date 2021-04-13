import 'package:salesappmobile/ApiServices/VisitPlan/visitplan_provider.dart';
import 'package:salesappmobile/Model/VisitPlan/ListVisitPlanModel.dart';
import 'package:salesappmobile/Model/VisitPlan/VisitPlanAddModel.dart';

class VisitPlanRepo {
  final VisitPlanProvider _visitPlanProvider = VisitPlanProvider();

  Future<List<ListVisitPlanModel>> fetchListVp(
          String dateStart, String dateEnd) =>
      _visitPlanProvider.getListVp(dateStart, dateEnd);
  Future<bool> fetchAddVisitPlan(VisitPlanAddModel model) =>
      _visitPlanProvider.addVisitPlan(model);
}
