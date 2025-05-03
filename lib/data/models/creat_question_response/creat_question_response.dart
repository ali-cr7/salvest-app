import 'dart:convert';

import 'data.dart';

class CreatQuestionResponse {
	String? message;
	Data? data;

	CreatQuestionResponse({this.message, this.data});

	factory CreatQuestionResponse.from(Map<String, dynamic> data) {
		return CreatQuestionResponse(
			message: data['message'] as String?,
			data: data['data'] == null
						? null
						: Data.fromMessageDataQuestionWhatSTheWeatherLikeAnswerNullUserId1UpdatedAt20250502T104355000000ZCreatedAt20250502T104355000000ZId1(data['data'] as Map<String, dynamic>),
		);
	}



	Map<String, dynamic> toMessageDataQuestionWhatSTheWeatherLikeAnswerNullUserId1UpdatedAt20250502T104355000000ZCreatedAt20250502T104355000000ZId1() {
		return {
			'message': message,
			'data': data?.toMessageDataQuestionWhatSTheWeatherLikeAnswerNullUserId1UpdatedAt20250502T104355000000ZCreatedAt20250502T104355000000ZId1(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CreatQuestionResponse].
	factory CreatQuestionResponse.fromJson(String data) {
		return CreatQuestionResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [CreatQuestionResponse] to a JSON string.
	String toJson() => json.encode(toMessageDataQuestionWhatSTheWeatherLikeAnswerNullUserId1UpdatedAt20250502T104355000000ZCreatedAt20250502T104355000000ZId1());
}
