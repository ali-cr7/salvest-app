import 'dart:convert';

class PropertyProfits {
	int? id;
	int? completedPropertyId;
	int? userId;
	String? profitAmount;
	String? propertyType;
	String? exactPosition;
	String? scheduledDate;
	String? transferStatus;

	PropertyProfits({
		this.id, 
		this.completedPropertyId, 
		this.userId, 
		this.profitAmount, 
		this.propertyType, 
		this.exactPosition, 
		this.scheduledDate, 
		this.transferStatus, 
	});

	factory PropertyProfits.fromMessageDataPropertiesId1CompletedPropertyId1UserId4ProfitAmount998PropertyTypeVilaExactPositionJaramanaScheduledDate20250601TransferStatusPendingId2CompletedPropertyId2UserId4ProfitAmount998PropertyTypeLandExactPositionJaramanaScheduledDate20250601TransferStatusPendingId3CompletedPropertyId3UserId4ProfitAmount998PropertyTypeApartmentExactPositionJaramanaScheduledDate20250601TransferStatusPendingPaginationCurrentPage1LastPage1PerPage5Total3NextPageUrlNullPrevPageUrlNull(Map<String, dynamic> data) {
		return PropertyProfits(
			id: data['id'] as int?,
			completedPropertyId: data['completed_property_id'] as int?,
			userId: data['user_id'] as int?,
			profitAmount: data['profit_amount'] as String?,
			propertyType: data['property_type'] as String?,
			exactPosition: data['exact_position'] as String?,
			scheduledDate: data['scheduled_date'] as String?,
			transferStatus: data['transfer_status'] as String?,
		);
	}



	Map<String, dynamic> toMessageDataPropertiesId1CompletedPropertyId1UserId4ProfitAmount998PropertyTypeVilaExactPositionJaramanaScheduledDate20250601TransferStatusPendingId2CompletedPropertyId2UserId4ProfitAmount998PropertyTypeLandExactPositionJaramanaScheduledDate20250601TransferStatusPendingId3CompletedPropertyId3UserId4ProfitAmount998PropertyTypeApartmentExactPositionJaramanaScheduledDate20250601TransferStatusPendingPaginationCurrentPage1LastPage1PerPage5Total3NextPageUrlNullPrevPageUrlNull() {
		return {
			'id': id,
			'completed_property_id': completedPropertyId,
			'user_id': userId,
			'profit_amount': profitAmount,
			'property_type': propertyType,
			'exact_position': exactPosition,
			'scheduled_date': scheduledDate,
			'transfer_status': transferStatus,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Property].
	factory PropertyProfits.fromJson(String data) {
		return PropertyProfits.fromMessageDataPropertiesId1CompletedPropertyId1UserId4ProfitAmount998PropertyTypeVilaExactPositionJaramanaScheduledDate20250601TransferStatusPendingId2CompletedPropertyId2UserId4ProfitAmount998PropertyTypeLandExactPositionJaramanaScheduledDate20250601TransferStatusPendingId3CompletedPropertyId3UserId4ProfitAmount998PropertyTypeApartmentExactPositionJaramanaScheduledDate20250601TransferStatusPendingPaginationCurrentPage1LastPage1PerPage5Total3NextPageUrlNullPrevPageUrlNull(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Property] to a JSON string.
	String toJson() => json.encode(toMessageDataPropertiesId1CompletedPropertyId1UserId4ProfitAmount998PropertyTypeVilaExactPositionJaramanaScheduledDate20250601TransferStatusPendingId2CompletedPropertyId2UserId4ProfitAmount998PropertyTypeLandExactPositionJaramanaScheduledDate20250601TransferStatusPendingId3CompletedPropertyId3UserId4ProfitAmount998PropertyTypeApartmentExactPositionJaramanaScheduledDate20250601TransferStatusPendingPaginationCurrentPage1LastPage1PerPage5Total3NextPageUrlNullPrevPageUrlNull());
}
