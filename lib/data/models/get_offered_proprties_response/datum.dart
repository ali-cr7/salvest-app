import 'dart:convert';

class Datum {
	int? id;
	int? userId;
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
	String? price;
	String? payWay;
	String? state;
	String? exactPosition;
	String? contract;
	int? legalCheck;
	int? expertCheck;
	int? accept;
	DateTime? createdAt;
	DateTime? updatedAt;

	Datum({
		this.id, 
		this.userId, 
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
		this.price, 
		this.payWay, 
		this.state, 
		this.exactPosition, 
		this.contract, 
		this.legalCheck, 
		this.expertCheck, 
		this.accept, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromMessageDataId8UserId1PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPrice1000000000PayWayCashStateDamascusExactPositionJaramanaContractBuyingLegalCheck1ExpertCheck1Accept1CreatedAt20250426T172411000000ZUpdatedAt20250428T081015000000Z(Map<String, dynamic> data) {
		return Datum(
			id: data['id'] as int?,
			userId: data['user_id'] as int?,
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
			price: data['price'] as String?,
			payWay: data['pay_way'] as String?,
			state: data['state'] as String?,
			exactPosition: data['exact_position'] as String?,
			contract: data['contract'] as String?,
			legalCheck: data['legal_check'] as int?,
			expertCheck: data['expert_check'] as int?,
			accept: data['accept'] as int?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> toMessageDataId8UserId1PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPrice1000000000PayWayCashStateDamascusExactPositionJaramanaContractBuyingLegalCheck1ExpertCheck1Accept1CreatedAt20250426T172411000000ZUpdatedAt20250428T081015000000Z() {
		return {
			'id': id,
			'user_id': userId,
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
			'price': price,
			'pay_way': payWay,
			'state': state,
			'exact_position': exactPosition,
			'contract': contract,
			'legal_check': legalCheck,
			'expert_check': expertCheck,
			'accept': accept,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMessageDataId8UserId1PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPrice1000000000PayWayCashStateDamascusExactPositionJaramanaContractBuyingLegalCheck1ExpertCheck1Accept1CreatedAt20250426T172411000000ZUpdatedAt20250428T081015000000Z(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageDataId8UserId1PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPrice1000000000PayWayCashStateDamascusExactPositionJaramanaContractBuyingLegalCheck1ExpertCheck1Accept1CreatedAt20250426T172411000000ZUpdatedAt20250428T081015000000Z());
}
