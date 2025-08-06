import 'dart:convert';

class Datum {
  String? userName;
  int? investmentId;
  String? propertyLocation;
  String? price;
  int? numberChance;

  Datum({
    this.userName,
    this.investmentId,
    this.propertyLocation,
    this.numberChance,
    this.price,
  });

  factory Datum.fromMessageDataUserNameInvestmentId2PropertyLocationLatakiaBlueBeachNumberChance2UserNameInvestmentId3PropertyLocationDamascusYaafourNumberChance2UserNameInvestmentId4PropertyLocationDamascusYaafourNumberChance1(
    Map<String, dynamic> data,
  ) {
    return Datum(
      userName: data['user_name'] as String?,
      investmentId: data['investment_id'] as int?,
      propertyLocation: data['property_location'] as String?,
      numberChance: data['number_chance'] as int?,
      price: data['price'] as String?,
    );
  }

  Map<String, dynamic>
  toMessageDataUserNameInvestmentId2PropertyLocationLatakiaBlueBeachNumberChance2UserNameInvestmentId3PropertyLocationDamascusYaafourNumberChance2UserNameInvestmentId4PropertyLocationDamascusYaafourNumberChance1() {
    return {
      'user_name': userName,
      'investment_id': investmentId,
      'property_location': propertyLocation,
      'number_chance': numberChance,
      'price': price
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
  factory Datum.fromJson(String data) {
    return Datum.fromMessageDataUserNameInvestmentId2PropertyLocationLatakiaBlueBeachNumberChance2UserNameInvestmentId3PropertyLocationDamascusYaafourNumberChance2UserNameInvestmentId4PropertyLocationDamascusYaafourNumberChance1(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
  String toJson() => json.encode(
    toMessageDataUserNameInvestmentId2PropertyLocationLatakiaBlueBeachNumberChance2UserNameInvestmentId3PropertyLocationDamascusYaafourNumberChance2UserNameInvestmentId4PropertyLocationDamascusYaafourNumberChance1(),
  );
}
