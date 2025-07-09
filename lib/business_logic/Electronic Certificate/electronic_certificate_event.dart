import 'package:equatable/equatable.dart';

abstract class ElectronicCertificateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadElectronicCertificates extends ElectronicCertificateEvent {}
