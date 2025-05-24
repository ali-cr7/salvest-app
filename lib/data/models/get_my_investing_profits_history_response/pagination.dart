import 'dart:convert';

class Pagination {
	int? currentPage;
	int? lastPage;
	int? perPage;
	int? total;
	dynamic nextPageUrl;
	dynamic prevPageUrl;

	Pagination({
		this.currentPage, 
		this.lastPage, 
		this.perPage, 
		this.total, 
		this.nextPageUrl, 
		this.prevPageUrl, 
	});

	factory Pagination.fromMessageDataPropertiesId1CompletedPropertyId1UserId4ProfitAmount998PropertyTypeVilaExactPositionJaramanaScheduledDate20250601TransferStatusPendingId2CompletedPropertyId2UserId4ProfitAmount998PropertyTypeLandExactPositionJaramanaScheduledDate20250601TransferStatusPendingId3CompletedPropertyId3UserId4ProfitAmount998PropertyTypeApartmentExactPositionJaramanaScheduledDate20250601TransferStatusPendingPaginationCurrentPage1LastPage1PerPage5Total3NextPageUrlNullPrevPageUrlNull(Map<String, dynamic> data) {
		return Pagination(
			currentPage: data['current_page'] as int?,
			lastPage: data['last_page'] as int?,
			perPage: data['per_page'] as int?,
			total: data['total'] as int?,
			nextPageUrl: data['next_page_url'] as dynamic,
			prevPageUrl: data['prev_page_url'] as dynamic,
		);
	}



	Map<String, dynamic> toMessageDataPropertiesId1CompletedPropertyId1UserId4ProfitAmount998PropertyTypeVilaExactPositionJaramanaScheduledDate20250601TransferStatusPendingId2CompletedPropertyId2UserId4ProfitAmount998PropertyTypeLandExactPositionJaramanaScheduledDate20250601TransferStatusPendingId3CompletedPropertyId3UserId4ProfitAmount998PropertyTypeApartmentExactPositionJaramanaScheduledDate20250601TransferStatusPendingPaginationCurrentPage1LastPage1PerPage5Total3NextPageUrlNullPrevPageUrlNull() {
		return {
			'current_page': currentPage,
			'last_page': lastPage,
			'per_page': perPage,
			'total': total,
			'next_page_url': nextPageUrl,
			'prev_page_url': prevPageUrl,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Pagination].
	factory Pagination.fromJson(String data) {
		return Pagination.fromMessageDataPropertiesId1CompletedPropertyId1UserId4ProfitAmount998PropertyTypeVilaExactPositionJaramanaScheduledDate20250601TransferStatusPendingId2CompletedPropertyId2UserId4ProfitAmount998PropertyTypeLandExactPositionJaramanaScheduledDate20250601TransferStatusPendingId3CompletedPropertyId3UserId4ProfitAmount998PropertyTypeApartmentExactPositionJaramanaScheduledDate20250601TransferStatusPendingPaginationCurrentPage1LastPage1PerPage5Total3NextPageUrlNullPrevPageUrlNull(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Pagination] to a JSON string.
	String toJson() => json.encode(toMessageDataPropertiesId1CompletedPropertyId1UserId4ProfitAmount998PropertyTypeVilaExactPositionJaramanaScheduledDate20250601TransferStatusPendingId2CompletedPropertyId2UserId4ProfitAmount998PropertyTypeLandExactPositionJaramanaScheduledDate20250601TransferStatusPendingId3CompletedPropertyId3UserId4ProfitAmount998PropertyTypeApartmentExactPositionJaramanaScheduledDate20250601TransferStatusPendingPaginationCurrentPage1LastPage1PerPage5Total3NextPageUrlNullPrevPageUrlNull());
}
