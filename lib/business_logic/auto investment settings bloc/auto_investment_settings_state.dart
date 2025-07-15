part of 'auto_investment_settings_bloc.dart';

@immutable
class AutoInvestmentSettingsState {
  final int investmentAmount;
  final String investmentMode;
  final int expectedProfitMin;
  final int expectedProfitMax;
  final int minChanceInvested;
  final int maxChanceInvested;

  const AutoInvestmentSettingsState({
    this.investmentAmount = 100,
    this.investmentMode = 'Balanced',
    this.expectedProfitMin = 5,
    this.expectedProfitMax = 15,
    this.minChanceInvested = 1,
    this.maxChanceInvested = 10,
  });

  AutoInvestmentSettingsState copyWith({
    int? investmentAmount,
    String? investmentMode,
    int? expectedProfitMin,
    int? expectedProfitMax,
    int? minChanceInvested,
    int? maxChanceInvested,
  }) {
    return AutoInvestmentSettingsState(
      investmentAmount: investmentAmount ?? this.investmentAmount,
      investmentMode: investmentMode ?? this.investmentMode,
      expectedProfitMin: expectedProfitMin ?? this.expectedProfitMin,
      expectedProfitMax: expectedProfitMax ?? this.expectedProfitMax,
      minChanceInvested: minChanceInvested ?? this.minChanceInvested,
      maxChanceInvested: maxChanceInvested ?? this.maxChanceInvested,
    );
  }

  Map<String, dynamic> toMap() => {
    'investment_amount': investmentAmount,
    'investment_mode': investmentMode,
    'expected_profit_min': expectedProfitMin,
    'expected_profit_max': expectedProfitMax,
    'min_chance_invested': minChanceInvested,
    'max_chance_invested': maxChanceInvested,
  };

  String toJson() => jsonEncode(toMap());

  factory AutoInvestmentSettingsState.fromMap(Map<String, dynamic> map) {
    return AutoInvestmentSettingsState(
      investmentAmount: map['investment_amount'] ?? 0,
      investmentMode: map['investment_mode'] ?? 'Balanced',
      expectedProfitMin: map['expected_profit_min'] ?? 0,
      expectedProfitMax: map['expected_profit_max'] ?? 0,
      minChanceInvested: map['min_chance_invested'] ?? 0,
      maxChanceInvested: map['max_chance_invested'] ?? 0,
    );
  }
   Future<FormData> toFormData() async {
    final map = toMap();
    return FormData.fromMap(map);
  }

  factory AutoInvestmentSettingsState.fromJson(String source) =>
      AutoInvestmentSettingsState.fromMap(jsonDecode(source));
}

