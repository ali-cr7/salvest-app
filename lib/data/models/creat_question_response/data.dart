import 'dart:convert';

class Data {
	String? question;
	dynamic answer;
	int? userId;
	DateTime? updatedAt;
	DateTime? createdAt;
	int? id;

	Data({
		this.question, 
		this.answer, 
		this.userId, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Data.fromMessageDataQuestionWhatSTheWeatherLikeAnswerNullUserId1UpdatedAt20250502T104355000000ZCreatedAt20250502T104355000000ZId1(Map<String, dynamic> data) {
		return Data(
			question: data['question'] as String?,
			answer: data['Answer'] as dynamic,
			userId: data['user_id'] as int?,
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			id: data['id'] as int?,
		);
	}



	Map<String, dynamic> toMessageDataQuestionWhatSTheWeatherLikeAnswerNullUserId1UpdatedAt20250502T104355000000ZCreatedAt20250502T104355000000ZId1() {
		return {
			'question': question,
			'Answer': answer,
			'user_id': userId,
			'updated_at': updatedAt?.toIso8601String(),
			'created_at': createdAt?.toIso8601String(),
			'id': id,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Data].
	factory Data.fromJson(String data) {
		return Data.fromMessageDataQuestionWhatSTheWeatherLikeAnswerNullUserId1UpdatedAt20250502T104355000000ZCreatedAt20250502T104355000000ZId1(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Data] to a JSON string.
	String toJson() => json.encode(toMessageDataQuestionWhatSTheWeatherLikeAnswerNullUserId1UpdatedAt20250502T104355000000ZCreatedAt20250502T104355000000ZId1());
}
