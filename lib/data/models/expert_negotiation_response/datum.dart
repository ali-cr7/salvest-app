import 'dart:convert';

class Datum {
	int? id;
	int? expertId;
	String? expertName;
	int? propertyForSaleId;
	String? textOfTheAgreement;
	String? paymentMechanism;
	String? status;
	String? createdAt;
	String? updatedAt;

	Datum({
		this.id, 
		this.expertId, 
		this.expertName, 
		this.propertyForSaleId, 
		this.textOfTheAgreement, 
		this.paymentMechanism, 
		this.status, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromMessageDataId2ExpertId6ExpertNameEconomicPropertyForSaleId1TextOfTheAgreementHhihihihihihiiihiihihPaymentMechanismCashStatusCreatedAt20250510UpdatedAt20250510(Map<String, dynamic> data) {
		return Datum(
			id: data['id'] as int?,
			expertId: data['expert_id'] as int?,
			expertName: data['expert_name'] as String?,
			propertyForSaleId: data['property_for_sale_id'] as int?,
			textOfTheAgreement: data['Text_of_the_agreement'] as String?,
			paymentMechanism: data['Payment_Mechanism'] as String?,
			status: data['status'] as String?,
			createdAt: data['created_at'] as String?,
			updatedAt: data['updated_at'] as String?,
		);
	}



	Map<String, dynamic> toMessageDataId2ExpertId6ExpertNameEconomicPropertyForSaleId1TextOfTheAgreementHhihihihihihiiihiihihPaymentMechanismCashStatusCreatedAt20250510UpdatedAt20250510() {
		return {
			'id': id,
			'expert_id': expertId,
			'expert_name': expertName,
			'property_for_sale_id': propertyForSaleId,
			'Text_of_the_agreement': textOfTheAgreement,
			'Payment_Mechanism': paymentMechanism,
			'status': status,
			'created_at': createdAt,
			'updated_at': updatedAt,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMessageDataId2ExpertId6ExpertNameEconomicPropertyForSaleId1TextOfTheAgreementHhihihihihihiiihiihihPaymentMechanismCashStatusCreatedAt20250510UpdatedAt20250510(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageDataId2ExpertId6ExpertNameEconomicPropertyForSaleId1TextOfTheAgreementHhihihihihihiiihiihihPaymentMechanismCashStatusCreatedAt20250510UpdatedAt20250510());
}
