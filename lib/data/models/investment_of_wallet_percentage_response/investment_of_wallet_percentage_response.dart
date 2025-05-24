import 'dart:convert';

import 'data.dart';

class InvestmentOfWalletPercentageResponse {
	String? message;
	Data? data;

	InvestmentOfWalletPercentageResponse({this.message, this.data});

	factory InvestmentOfWalletPercentageResponse.from(Map<String, dynamic> data) {
		return InvestmentOfWalletPercentageResponse(
			message: data['message'] as String?,
			data: data['data'] == null
						? null
						: Data.fromMessageDataPercentage8(data['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMessageDataPercentage8() => {
				'message': message,
				'data': data?.toMessageDataPercentage8(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [InvestmentOfWalletPercentageResponse].
	factory InvestmentOfWalletPercentageResponse.fromJson(String data) {
		return InvestmentOfWalletPercentageResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [InvestmentOfWalletPercentageResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataPercentage8());
}
