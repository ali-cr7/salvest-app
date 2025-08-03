part of 'withdrawls_request_bloc.dart';

@immutable
sealed class WithdrawlsRequestState {}

final class WithdrawlsRequestInitial extends WithdrawlsRequestState {}

final class WithdrawlsRequestLoading extends WithdrawlsRequestState {}

final class WithdrawlsRequestFailure extends WithdrawlsRequestState {
  final HelperResponse helperResponse;

  WithdrawlsRequestFailure({required this.helperResponse});
}

final class WithdrawlsRequestSuccess extends WithdrawlsRequestState {
  final MyWithdrawlsRequestsReponse myWithdrawlsRequests;

  WithdrawlsRequestSuccess({required this.myWithdrawlsRequests});
}
