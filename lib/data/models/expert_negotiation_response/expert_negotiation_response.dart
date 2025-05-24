import 'dart:convert';

import 'datum.dart';

class ExpertNegotiationResponse {
	String? message;
	List<Datum>? data;

	ExpertNegotiationResponse({this.message, this.data});

	factory ExpertNegotiationResponse.from(Map<String, dynamic> data) {
		return ExpertNegotiationResponse(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMessageDataId2ExpertId6ExpertNameEconomicPropertyForSaleId1TextOfTheAgreementHhihihihihihiiihiihihPaymentMechanismCashStatusCreatedAt20250510UpdatedAt20250510(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataId2ExpertId6ExpertNameEconomicPropertyForSaleId1TextOfTheAgreementHhihihihihihiiihiihihPaymentMechanismCashStatusCreatedAt20250510UpdatedAt20250510() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageDataId2ExpertId6ExpertNameEconomicPropertyForSaleId1TextOfTheAgreementHhihihihihihiiihiihihPaymentMechanismCashStatusCreatedAt20250510UpdatedAt20250510()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExpertNegotiationResponse].
	factory ExpertNegotiationResponse.fromJson(String data) {
		return ExpertNegotiationResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ExpertNegotiationResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataId2ExpertId6ExpertNameEconomicPropertyForSaleId1TextOfTheAgreementHhihihihihihiiihiihihPaymentMechanismCashStatusCreatedAt20250510UpdatedAt20250510());
}
