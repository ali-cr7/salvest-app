import 'dart:convert';

class Datum {
	int? id;
	String? question;
	String? answer;
	DateTime? createdAt;
	DateTime? updatedAt;

	Datum({
		this.id, 
		this.question, 
		this.answer, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Datum.fromMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z(Map<String, dynamic> data) {
		return Datum(
			id: data['id'] as int?,
			question: data['question'] as String?,
			answer: data['Answer'] as String?,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> toMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z() {
		return {
			'id': id,
			'question': question,
			'Answer': answer,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageDataId1QuestionCanIInvestTwoPropertiesAtTheSameTimeAnswerOfCourseYouCanCreatedAt20250418T172057000000ZUpdatedAt20250418T172057000000ZId2QuestionCanIInvestThreePropertiesAtTheSameTimeAnswerOfCourseYouCanYouCanInvest10CreatedAt20250419T041137000000ZUpdatedAt20250419T041137000000Z());
}
