part of 'inveseting_history_bloc.dart';

@immutable
sealed class InvesetingHistoryState {}

final class InvesetingHistoryInitial extends InvesetingHistoryState {}

final class InvesetingHistoryLoading extends InvesetingHistoryState {}

final class InvesetingHistorySuccess extends InvesetingHistoryState {
  final List<InvestedProperty> investedProprties;
  final bool hasReachedMax;

  InvesetingHistorySuccess({required this.investedProprties,required this.hasReachedMax});
    InvesetingHistorySuccess copyWith({
    List<InvestedProperty>? investedProprties,
    bool? hasReachedMax,
  }) {
    return InvesetingHistorySuccess(
      investedProprties: investedProprties ?? this.investedProprties,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

final class GetWalletProfitsSuccessState extends InvesetingHistoryState {
  final List<PropertyProfits>? propertyProfits;
  final bool hasReachedMax;

   GetWalletProfitsSuccessState({required this.propertyProfits,required this.hasReachedMax});
    GetWalletProfitsSuccessState copyWith({
    List<PropertyProfits>? propertyProfits,
    bool? hasReachedMax,
  }) {
    return GetWalletProfitsSuccessState(
      propertyProfits: propertyProfits ?? this.propertyProfits,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

final class InvesetingHistoryFailure extends InvesetingHistoryState {
  final HelperResponse helperResponse;

  InvesetingHistoryFailure({required this.helperResponse});
}
