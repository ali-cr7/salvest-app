part of 'withdraw_money_bloc.dart';

@immutable
// sealed class WithdrawMoneyState {}

 final class WithdrawMoneyInitial extends WithdrawMoneyState {}
// part of 'withdraw_money_bloc.dart';

@immutable
class WithdrawMoneyState {
  final int amount;
  final String method;
  final Map<String, dynamic> methodDetails;

  const WithdrawMoneyState({
    this.amount = 0,
    this.method = 'bank',
    this.methodDetails = const {},
  });

  WithdrawMoneyState copyWith({
    int? amount,
    String? method,
    Map<String, dynamic>? methodDetails,
  }) {
    return WithdrawMoneyState(
      amount: amount ?? this.amount,
      method: method ?? this.method,
      methodDetails: methodDetails ?? this.methodDetails,
    );
  }

  Map<String, dynamic> toMap() => {
        'amount': amount,
        'method': method,
        'method_details': methodDetails,
      };

  String toJson() => jsonEncode(toMap());

  factory WithdrawMoneyState.fromMap(Map<String, dynamic> map) {
    return WithdrawMoneyState(
      amount: map['amount'] ?? 0,
      method: map['method'] ?? 'bank',
      methodDetails: Map<String, dynamic>.from(map['method_details'] ?? {}),
    );
  }

  factory WithdrawMoneyState.fromJson(String source) =>
      WithdrawMoneyState.fromMap(jsonDecode(source));

  Future<FormData> toFormData() async {
    final map = {
      'amount': amount,
      'method': method,
      'method_details': methodDetails,
    };

    return FormData.fromMap(map);
  }
}
