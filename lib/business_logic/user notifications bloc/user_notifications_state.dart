part of 'user_notifications_bloc.dart';

@immutable
sealed class UserNotificationsState {}

final class UserNotificationsInitial extends UserNotificationsState {}

final class UserNotificationsLoading extends UserNotificationsState {}

final class UserNotificationsSuccess extends UserNotificationsState {
  final GetNotificationsResponse getNotificationsResponse;

  UserNotificationsSuccess({required this.getNotificationsResponse});
}

final class UserNotificationsFailure extends UserNotificationsState {
  final HelperResponse helperResponse;

  UserNotificationsFailure({required this.helperResponse});
}
