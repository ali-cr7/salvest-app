part of 'get_user_properties_owner_ship_e_bloc.dart';

@immutable
sealed class GetUserPropertiesOwnerShipEState {}

final class GetUserPropertiesOwnerShipEInitial
    extends GetUserPropertiesOwnerShipEState {}

final class GetUserPropertiesOwnerShipLoading
    extends GetUserPropertiesOwnerShipEState {}

final class TransferPropertiesOwnerShipLoading
    extends GetUserPropertiesOwnerShipEState {}
final class GetUserPropertiesOwnerShipFailure
    extends GetUserPropertiesOwnerShipEState {
  final HelperResponse helperResponse;

  GetUserPropertiesOwnerShipFailure({required this.helperResponse});
}

final class TransferPropertiesOwnerShipFailure
    extends GetUserPropertiesOwnerShipEState {
  final HelperResponse helperResponse;

  TransferPropertiesOwnerShipFailure({required this.helperResponse});
}
final class TransferPropertiesOwnerShipSuccess
    extends GetUserPropertiesOwnerShipEState {
  final String message;

  TransferPropertiesOwnerShipSuccess({required this.message});
}

final class GetUserPropertiesOwnerShipSuccess
    extends GetUserPropertiesOwnerShipEState {
  final GetUserPropertiesOwnerShipResposne getUserPropertiesOwnerShipResposne;

  GetUserPropertiesOwnerShipSuccess({
    required this.getUserPropertiesOwnerShipResposne,
  });
}


