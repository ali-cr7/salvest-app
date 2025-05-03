import 'dart:convert';

import 'property_image.dart';

class Property {
	int? propertyForInvestmentId;
	int? id;
	int? numberOfChances;
	String? expectedPrice;
	String? profitPercent;
	String? progressPercent;
	String? chancePrice;
	String? investmentTime;
	String? incomingTime;
	String? investmentMode;
	int? isCompleted;
	String? propertyType;
	String? area;
	int? numberOfRooms;
	int? numberOfBathrooms;
	int? propertyAge;
	String? decoration;
	String? kitchenType;
	String? flooringType;
	int? overlookFrom;
	String? balconySize;
	String? paintingType;
	String? payWay;
	String? state;
	String? exactPosition;
	String? contract;
	String? createdAt;
	String? updatedAt;
	List<PropertyImage>? propertyImages;

	Property({
		this.propertyForInvestmentId, 
		this.id, 
		this.numberOfChances, 
		this.expectedPrice, 
		this.profitPercent, 
		this.progressPercent, 
		this.chancePrice, 
		this.investmentTime, 
		this.incomingTime, 
		this.investmentMode, 
		this.isCompleted, 
		this.propertyType, 
		this.area, 
		this.numberOfRooms, 
		this.numberOfBathrooms, 
		this.propertyAge, 
		this.decoration, 
		this.kitchenType, 
		this.flooringType, 
		this.overlookFrom, 
		this.balconySize, 
		this.paintingType, 
		this.payWay, 
		this.state, 
		this.exactPosition, 
		this.contract, 
		this.createdAt, 
		this.updatedAt, 
		this.propertyImages, 
	});

	factory Property.fromMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull(Map<String, dynamic> data) {
		return Property(
			propertyForInvestmentId: data['property_for_investment_id'] as int?,
			id: data['id'] as int?,
			numberOfChances: data['number_of_chances'] as int?,
			expectedPrice: data['expected_price'] as String?,
			profitPercent: data['profit_percent'] as String?,
			progressPercent: data['progress_percent'] as String?,
			chancePrice: data['chance_price'] as String?,
			investmentTime: data['investment_time'] as String?,
			incomingTime: data['incoming_time'] as String?,
			investmentMode: data['investment_mode'] as String?,
			isCompleted: data['is_completed'] as int?,
			propertyType: data['property_type'] as String?,
			area: data['area'] as String?,
			numberOfRooms: data['number_of_rooms'] as int?,
			numberOfBathrooms: data['number_of_bathrooms'] as int?,
			propertyAge: data['property_age'] as int?,
			decoration: data['decoration'] as String?,
			kitchenType: data['kitchen_type'] as String?,
			flooringType: data['flooring_type'] as String?,
			overlookFrom: data['overlook_from'] as int?,
			balconySize: data['balcony_size'] as String?,
			paintingType: data['painting_type'] as String?,
			payWay: data['pay_way'] as String?,
			state: data['state'] as String?,
			exactPosition: data['exact_position'] as String?,
			contract: data['contract'] as String?,
			createdAt: data['created_at'] as String?,
			updatedAt: data['updated_at'] as String?,
			propertyImages: (data['property_images'] as List<dynamic>?)
						?.map((e) => PropertyImage.fromMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull() {
		return {
			'property_for_investment_id': propertyForInvestmentId,
			'id': id,
			'number_of_chances': numberOfChances,
			'expected_price': expectedPrice,
			'profit_percent': profitPercent,
			'progress_percent': progressPercent,
			'chance_price': chancePrice,
			'investment_time': investmentTime,
			'incoming_time': incomingTime,
			'investment_mode': investmentMode,
			'is_completed': isCompleted,
			'property_type': propertyType,
			'area': area,
			'number_of_rooms': numberOfRooms,
			'number_of_bathrooms': numberOfBathrooms,
			'property_age': propertyAge,
			'decoration': decoration,
			'kitchen_type': kitchenType,
			'flooring_type': flooringType,
			'overlook_from': overlookFrom,
			'balcony_size': balconySize,
			'painting_type': paintingType,
			'pay_way': payWay,
			'state': state,
			'exact_position': exactPosition,
			'contract': contract,
			'created_at': createdAt,
			'updated_at': updatedAt,
			'property_images': propertyImages?.map((e) => e.toMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Property].
	factory Property.fromJson(String data) {
		return Property.fromMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Property] to a JSON string.
	String toJson() => json.encode(toMessageDataPropertiesPropertyForInvestmentId1Id8NumberOfChances3ExpectedPrice10000000ProfitPercent1500ProgressPercent5000ChancePrice200000InvestmentTime20250501IncomingTime20250601InvestmentModeBalancedIsCompleted0PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPayWayCashStateDamascusExactPositionJaramanaContractBuyingCreatedAt20250426UpdatedAt20250428PropertyImagesId8NameScreenshot17451650381745688251PngPathPropertyImageScreenshot17451650381745688251PngPropertyForSaleId8CreatedAt20250426T172411000000ZUpdatedAt20250426T172411000000ZPaginationCurrentPage1LastPage1PerPage5Total1NextPageUrlNullPrevPageUrlNull());
}
