part of 'inveseting_history_bloc.dart';

@immutable
sealed class InvesetingHistoryEvent {}
class GetInvestingHistory extends InvesetingHistoryEvent{
    final int page;

  GetInvestingHistory({required this.page});
  @override
  List<Object?> get props => [];

}
class GetInvestingProfitHistory extends InvesetingHistoryEvent{
   final int page;

  GetInvestingProfitHistory({required this.page});
  @override
  List<Object?> get props => [];

}

