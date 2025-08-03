import 'dart:convert';

import 'method_details.dart';

class MyWithdrawlsRequests {
	int? id;
	int? userId;
	String? amount;
	String? method;
	MethodDetails? methodDetails;
	String? status;
	dynamic adminNotes;
	dynamic transactionReference;
	dynamic approvedAt;
	dynamic processedAt;
	DateTime? createdAt;
	DateTime? updatedAt;

	MyWithdrawlsRequests({
		this.id, 
		this.userId, 
		this.amount, 
		this.method, 
		this.methodDetails, 
		this.status, 
		this.adminNotes, 
		this.transactionReference, 
		this.approvedAt, 
		this.processedAt, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory MyWithdrawlsRequests.from(Map<String, dynamic> data) {
		return MyWithdrawlsRequests(
			id: data['id'] as int?,
			userId: data['user_id'] as int?,
			amount: data['amount'] as String?,
			method: data['method'] as String?,
			methodDetails: data['method_details'] == null
						? null
						: MethodDetails.from1(data['method_details'] as Map<String, dynamic>),
			status: data['status'] as String?,
			adminNotes: data['admin_notes'] as dynamic,
			transactionReference: data['transaction_reference'] as dynamic,
			approvedAt: data['approved_at'] as dynamic,
			processedAt: data['processed_at'] as dynamic,
			createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
			updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
		);
	}



	Map<String, dynamic> to() {
		return {
			'id': id,
			'user_id': userId,
			'amount': amount,
			'method': method,
			'method_details': methodDetails?.to1(),
			'status': status,
			'admin_notes': adminNotes,
			'transaction_reference': transactionReference,
			'approved_at': approvedAt,
			'processed_at': processedAt,
			'created_at': createdAt?.toIso8601String(),
			'updated_at': updatedAt?.toIso8601String(),		};
	}

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MyWithdrawlsRequests].
	factory MyWithdrawlsRequests.fromJson(String data) {
		return MyWithdrawlsRequests.from(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [MyWithdrawlsRequests] to a JSON string.
	String toJson() => json.encode(to());
  
}
