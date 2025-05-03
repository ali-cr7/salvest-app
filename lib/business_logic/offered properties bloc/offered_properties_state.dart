part of 'offered_properties_bloc.dart';

@immutable
sealed class OfferedPropertiesState {}

final class OfferedPropertiesInitial extends OfferedPropertiesState {}

final class OfferedPropertiesLoading extends OfferedPropertiesState {}

final class OfferedPropertiesSuccess extends OfferedPropertiesState {
  final GetOfferedProprtiesResponse getOfferedProprtiesResponse;

  OfferedPropertiesSuccess({required this.getOfferedProprtiesResponse});
}

final class OfferedPropertiesFailure extends OfferedPropertiesState {
  final HelperResponse helperResponse;

  OfferedPropertiesFailure({required this.helperResponse});
}
