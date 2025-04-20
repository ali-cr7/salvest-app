import 'dart:convert';

import 'datum.dart';

class FaqRespone {
	String? message;
	List<Datum>? data;

	FaqRespone({this.message, this.data});

	factory FaqRespone.from(Map<String, dynamic> data) {
		return FaqRespone(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [FaqRespone].
	factory FaqRespone.fromJson(String data) {
		return FaqRespone.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [FaqRespone] to a JSON string.
	String toJson() => json.encode(toMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z());
}
