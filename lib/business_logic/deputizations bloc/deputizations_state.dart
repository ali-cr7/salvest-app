part of 'deputizations_bloc.dart';

@immutable
sealed class DeputizationsState {}

final class DeputizationsInitial extends DeputizationsState {}

final class CreateDeputizationsLoading extends DeputizationsState {}

final class CreateDeputizationsFailure extends DeputizationsState {
  final HelperResponse helperResponse;

  CreateDeputizationsFailure({required this.helperResponse});
}

final class CreateDeputizationsSuccess extends DeputizationsState {
  final String message;

  CreateDeputizationsSuccess({required this.message});
}

final class GetDeputizationsLoading extends DeputizationsState {}

final class GetDeputizationsFailure extends DeputizationsState {
  final HelperResponse helperResponse;

  GetDeputizationsFailure({required this.helperResponse});
}

final class GetDeputizationsSuccess extends DeputizationsState {
  final GetDeputaiztionForUserResponse deputizationsResponse;

  GetDeputizationsSuccess({required this.deputizationsResponse});
}
