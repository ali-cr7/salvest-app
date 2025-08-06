part of 'search_user_email_bloc.dart';

@immutable
sealed class SearchUserEmailEvent {}

class SearhForUserEvent extends SearchUserEmailEvent {
  final String email;

  SearhForUserEvent({required this.email});
}
