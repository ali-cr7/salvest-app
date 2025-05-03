import 'dart:convert';

import 'datum.dart';

class GetWalletBalanceResponse {
	String? message;
	List<Datum>? data;

	GetWalletBalanceResponse({this.message, this.data});

	factory GetWalletBalanceResponse.from(Map<String, dynamic> data) {
		return GetWalletBalanceResponse(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMessageDataId1UserId1Balance200000CurrencyUsdWalletTypeInvestmentIsActive1CreatedAt20250426UpdatedAt20250430(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataId1UserId1Balance200000CurrencyUsdWalletTypeInvestmentIsActive1CreatedAt20250426UpdatedAt20250430() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageDataId1UserId1Balance200000CurrencyUsdWalletTypeInvestmentIsActive1CreatedAt20250426UpdatedAt20250430()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetWalletBalanceResponse].
	factory GetWalletBalanceResponse.fromJson(String data) {
		return GetWalletBalanceResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GetWalletBalanceResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataId1UserId1Balance200000CurrencyUsdWalletTypeInvestmentIsActive1CreatedAt20250426UpdatedAt20250430());
}
