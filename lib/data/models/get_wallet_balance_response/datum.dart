import 'dart:convert';

class Datum {
	int? id;
	int? userId;
	String? balance;
	String? currency;
	String? walletType;
	int? isActive;
	String? createdAt;
	String? updatedAt;

	Datum({
		this.id, 
		this.userId, 
		this.balance, 
		this.currency, 
		this.walletType, 
		this.isActive, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromMessageDataId1UserId1Balance200000CurrencyUsdWalletTypeInvestmentIsActive1CreatedAt20250426UpdatedAt20250430(Map<String, dynamic> data) {
		return Datum(
			id: data['id'] as int?,
			userId: data['user_id'] as int?,
			balance: data['balance'] as String?,
			currency: data['currency'] as String?,
			walletType: data['wallet_type'] as String?,
			isActive: data['is_active'] as int?,
			createdAt: data['created_at'] as String?,
			updatedAt: data['updated_at'] as String?,
		);
	}



	Map<String, dynamic> toMessageDataId1UserId1Balance200000CurrencyUsdWalletTypeInvestmentIsActive1CreatedAt20250426UpdatedAt20250430() {
		return {
			'id': id,
			'user_id': userId,
			'balance': balance,
			'currency': currency,
			'wallet_type': walletType,
			'is_active': isActive,
			'created_at': createdAt,
			'updated_at': updatedAt,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMessageDataId1UserId1Balance200000CurrencyUsdWalletTypeInvestmentIsActive1CreatedAt20250426UpdatedAt20250430(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageDataId1UserId1Balance200000CurrencyUsdWalletTypeInvestmentIsActive1CreatedAt20250426UpdatedAt20250430());
}
