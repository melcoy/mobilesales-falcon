part of 'visit_plan_checkout_bloc.dart';

@immutable
abstract class VisitPlanCheckoutState {}

class VisitPlanCheckoutInitial extends VisitPlanCheckoutState {}

class VisitPlanCheckoutSuccess extends VisitPlanCheckoutState {}

class VisitPlanCheckoutLoading extends VisitPlanCheckoutState {}

class VisitPlanCheckoutFaillure extends VisitPlanCheckoutState {
  final String errMsg;
  VisitPlanCheckoutFaillure(this.errMsg);
}
