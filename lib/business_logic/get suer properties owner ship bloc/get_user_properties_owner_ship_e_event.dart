part of 'get_user_properties_owner_ship_e_bloc.dart';

@immutable
sealed class GetUserPropertiesOwnerShipEEvent {}

class GetOwneredProprtiesEvent extends GetUserPropertiesOwnerShipEEvent {}

class TransferOwneredProprties extends GetUserPropertiesOwnerShipEEvent {
  final int newUserId;
  final int certificateId;

  TransferOwneredProprties({required this.newUserId, required this.certificateId});
}
