import 'package:equatable/equatable.dart';

import 'package:salvest_app/data/models/electronic%20property%20certificate/datum.property.certificate.dart';

abstract class ElectronicCertificateState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ElectronicCertificateInitial extends ElectronicCertificateState {}

class ElectronicCertificateLoading extends ElectronicCertificateState {}

class ElectronicCertificateLoaded extends ElectronicCertificateState {
  final List<Electronic> certificates;
  ElectronicCertificateLoaded(this.certificates);
  @override
  List<Object?> get props => [certificates];
}

class ElectronicCertificateError extends ElectronicCertificateState {
  final String message;
  ElectronicCertificateError(this.message);
  @override
  List<Object?> get props => [message];
}
