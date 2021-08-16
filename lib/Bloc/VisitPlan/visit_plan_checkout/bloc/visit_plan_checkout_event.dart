part of 'visit_plan_checkout_bloc.dart';

@immutable
abstract class VisitPlanCheckoutEvent {}

class VisitPlanCheckoutPressed extends VisitPlanCheckoutEvent {
  final CheckInDto dto;
  VisitPlanCheckoutPressed(this.dto);
}
