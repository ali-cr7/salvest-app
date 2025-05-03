part of 'properties_for_investment_bloc.dart';

@immutable
sealed class PropertiesForInvestmentState {}

final class PropertiesForInvestmentInitial
    extends PropertiesForInvestmentState {}

final class PropertiesForInvestmentLoading
    extends PropertiesForInvestmentState {}

final class PropertiesForInvestmentSuccess
    extends PropertiesForInvestmentState {
  final GetProprtiesForInvestmentResponse  getPropertiesForInvestmentResponse;

  PropertiesForInvestmentSuccess({required this.getPropertiesForInvestmentResponse});
}

final class PropertiesForInvestmentFailure
    extends PropertiesForInvestmentState {
  final HelperResponse helperResponse;

  PropertiesForInvestmentFailure({required this.helperResponse});
}
