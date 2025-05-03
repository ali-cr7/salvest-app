import 'dart:convert';

import 'datum.dart';

class GetOfferedProprtiesResponse {
	String? message;
	List<Datum>? data;

	GetOfferedProprtiesResponse({this.message, this.data});

	factory GetOfferedProprtiesResponse.from(Map<String, dynamic> data) {
		return GetOfferedProprtiesResponse(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMessageDataId8UserId1PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPrice1000000000PayWayCashStateDamascusExactPositionJaramanaContractBuyingLegalCheck1ExpertCheck1Accept1CreatedAt20250426T172411000000ZUpdatedAt20250428T081015000000Z(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataId8UserId1PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPrice1000000000PayWayCashStateDamascusExactPositionJaramanaContractBuyingLegalCheck1ExpertCheck1Accept1CreatedAt20250426T172411000000ZUpdatedAt20250428T081015000000Z() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageDataId8UserId1PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPrice1000000000PayWayCashStateDamascusExactPositionJaramanaContractBuyingLegalCheck1ExpertCheck1Accept1CreatedAt20250426T172411000000ZUpdatedAt20250428T081015000000Z()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetOfferedProprtiesResponse].
	factory GetOfferedProprtiesResponse.fromJson(String data) {
		return GetOfferedProprtiesResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GetOfferedProprtiesResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataId8UserId1PropertyTypeLandArea30000NumberOfRooms4NumberOfBathrooms2PropertyAge2DecorationDeluxeKitchenTypeWestrenFlooringTypeGraniteOverlookFrom4BalconySize10000PaintingTypeRegularPrice1000000000PayWayCashStateDamascusExactPositionJaramanaContractBuyingLegalCheck1ExpertCheck1Accept1CreatedAt20250426T172411000000ZUpdatedAt20250428T081015000000Z());
}
