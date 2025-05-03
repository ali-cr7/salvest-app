import 'dart:convert';

class PropertyImage {
	int? id;
	String? name;
	String? path;
	int? propertyForSaleId;
	DateTime? createdAt;
	DateTime? updatedAt;

	PropertyImage({
		this.id, 
		this.name, 
		this.path, 
		this.propertyForSaleId, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory PropertyImage.fromMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull(Map<String, dynamic> data) {
		return PropertyImage(
			id: data['id'] as int?,
			name: data['name'] as String?,
			path: data['path'] as String?,
			propertyForSaleId: data['property_for_sale_id'] as int?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> toMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull() {
		return {
			'id': id,
			'name': name,
			'path': path,
			'property_for_sale_id': propertyForSaleId,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PropertyImage].
	factory PropertyImage.fromJson(String data) {
		return PropertyImage.fromMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [PropertyImage] to a JSON string.
	String toJson() => json.encode(toMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull());
}
