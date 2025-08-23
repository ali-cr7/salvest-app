part of 'deputizations_bloc.dart';

@immutable
sealed class DeputizationsEvent {}

class CreateDeputizationsEvent extends DeputizationsEvent {
  final String nationalId;
  final String deputizationContent;

  CreateDeputizationsEvent({required this.nationalId, required this.deputizationContent});
}
