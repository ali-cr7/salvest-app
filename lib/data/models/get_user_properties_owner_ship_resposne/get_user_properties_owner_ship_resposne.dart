import 'dart:convert';

import 'datum.dart';

class GetUserPropertiesOwnerShipResposne {
	String? message;
	List<Datum>? data;

	GetUserPropertiesOwnerShipResposne({this.message, this.data});

	factory GetUserPropertiesOwnerShipResposne.from(Map<String, dynamic> data) {
		return GetUserPropertiesOwnerShipResposne(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMessageDataUserNameInvestmentId2PropertyLocationLatakiaBlueBeachNumberChance2UserNameInvestmentId3PropertyLocationDamascusYaafourNumberChance2UserNameInvestmentId4PropertyLocationDamascusYaafourNumberChance1(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataUserNameInvestmentId2PropertyLocationLatakiaBlueBeachNumberChance2UserNameInvestmentId3PropertyLocationDamascusYaafourNumberChance2UserNameInvestmentId4PropertyLocationDamascusYaafourNumberChance1() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageDataUserNameInvestmentId2PropertyLocationLatakiaBlueBeachNumberChance2UserNameInvestmentId3PropertyLocationDamascusYaafourNumberChance2UserNameInvestmentId4PropertyLocationDamascusYaafourNumberChance1()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetUserPropertiesOwnerShipResposne].
	factory GetUserPropertiesOwnerShipResposne.fromJson(String data) {
		return GetUserPropertiesOwnerShipResposne.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [GetUserPropertiesOwnerShipResposne] to a JSON string.
	String toJson() => json.encode(toMessageDataUserNameInvestmentId2PropertyLocationLatakiaBlueBeachNumberChance2UserNameInvestmentId3PropertyLocationDamascusYaafourNumberChance2UserNameInvestmentId4PropertyLocationDamascusYaafourNumberChance1());
}
