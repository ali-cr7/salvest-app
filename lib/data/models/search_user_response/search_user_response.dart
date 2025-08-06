import 'dart:convert';

import 'datum.dart';

class SearchUserResponse {
	String? message;
	List<Datum>? data;

	SearchUserResponse({this.message, this.data});

	factory SearchUserResponse.from(Map<String, dynamic> data) {
		return SearchUserResponse(
			message: data['message'] as String?,
			data: (data['data'] as List<dynamic>?)
						?.map((e) => Datum.fromMessageMessagesUsersFoundDataUserId2NamePhone0944333222EmailKhaledMostafaGmailComUserId5NamePhone0955667788EmailYaserAtiaGmailCom(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toMessageMessagesUsersFoundDataUserId2NamePhone0944333222EmailKhaledMostafaGmailComUserId5NamePhone0955667788EmailYaserAtiaGmailCom() {
		return {
			'message': message,
			'data': data?.map((e) => e.toMessageMessagesUsersFoundDataUserId2NamePhone0944333222EmailKhaledMostafaGmailComUserId5NamePhone0955667788EmailYaserAtiaGmailCom()).toList(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchUserResponse].
	factory SearchUserResponse.fromJson(String data) {
		return SearchUserResponse.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [SearchUserResponse] to a JSON string.
	String toJson() => json.encode(toMessageMessagesUsersFoundDataUserId2NamePhone0944333222EmailKhaledMostafaGmailComUserId5NamePhone0955667788EmailYaserAtiaGmailCom());
}
