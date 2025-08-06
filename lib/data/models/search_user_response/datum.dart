import 'dart:convert';

class Datum {
	int? userId;
	String? name;
	String? phone;
	String? email;

	Datum({this.userId, this.name, this.phone, this.email});

	factory Datum.fromMessageMessagesUsersFoundDataUserId2NamePhone0944333222EmailKhaledMostafaGmailComUserId5NamePhone0955667788EmailYaserAtiaGmailCom(Map<String, dynamic> data) {
		return Datum(
			userId: data['user_id'] as int?,
			name: data['name'] as String?,
			phone: data['phone'] as String?,
			email: data['email'] as String?,
		);
	}



	Map<String, dynamic> toMessageMessagesUsersFoundDataUserId2NamePhone0944333222EmailKhaledMostafaGmailComUserId5NamePhone0955667788EmailYaserAtiaGmailCom() {
		return {
			'user_id': userId,
			'name': name,
			'phone': phone,
			'email': email,		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Datum].
	factory Datum.fromJson(String data) {
		return Datum.fromMessageMessagesUsersFoundDataUserId2NamePhone0944333222EmailKhaledMostafaGmailComUserId5NamePhone0955667788EmailYaserAtiaGmailCom(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Datum] to a JSON string.
	String toJson() => json.encode(toMessageMessagesUsersFoundDataUserId2NamePhone0944333222EmailKhaledMostafaGmailComUserId5NamePhone0955667788EmailYaserAtiaGmailCom());
}
