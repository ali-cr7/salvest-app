part of 'search_user_email_bloc.dart';

@immutable
sealed class SearchUserEmailState {}

final class SearchUserEmailInitial extends SearchUserEmailState {}

final class SearchUserEmailLoading extends SearchUserEmailState {}

final class SearchUserEmailSuccess extends SearchUserEmailState {
  final SearchUserResponse searchUserResponse;

  SearchUserEmailSuccess({required this.searchUserResponse});
}

final class SearchUserEmailFailure extends SearchUserEmailState {
  final HelperResponse helperResponse;

  SearchUserEmailFailure({required this.helperResponse});
}
