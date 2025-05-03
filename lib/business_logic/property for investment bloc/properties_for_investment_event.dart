part of 'properties_for_investment_bloc.dart';

@immutable
sealed class PropertiesForInvestmentEvent {}
class GetPropertiesForInvestmentsEvent extends PropertiesForInvestmentEvent {
  GetPropertiesForInvestmentsEvent({required this.propertyType});

  final String propertyType;

  @override
  List<Object?> get props => [propertyType];
}