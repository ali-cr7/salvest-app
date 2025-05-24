import 'dart:convert';

class Data {
	int? percentage;

	Data({this.percentage});

	factory Data.fromMessageDataPercentage8(Map<String, dynamic> data) => Data(
				percentage: data['percentage'] as int?,
			);

	Map<String, dynamic> toMessageDataPercentage8() => {
				'percentage': percentage,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
	factory Data.fromJson(String data) {
		return Data.fromMessageDataPercentage8(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
	String toJson() => json.encode(toMessageDataPercentage8());
}
