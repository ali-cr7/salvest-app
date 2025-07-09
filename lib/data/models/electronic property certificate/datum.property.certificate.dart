import 'package:equatable/equatable.dart';

import 'request_from_admin.property.certificate.dart';

class Electronic extends Equatable {
  final int? id;
  final int? requestFromAdminId;
  final String? sellerName;
  final String? propertyLocation;
  final String? lawyerName;
  final String? propertyPrice;
  final String? paymentMethod;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final RequestFromAdmin? requestFromAdmin;

  const Electronic({
    this.id,
    this.requestFromAdminId,
    this.sellerName,
    this.propertyLocation,
    this.lawyerName,
    this.propertyPrice,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.requestFromAdmin,
  });

  factory Electronic.fromJson(Map<String, dynamic> json) => Electronic(
    id: json['id'] as int?,
    requestFromAdminId: json['request_from_admin_id'] as int?,
    sellerName: json['Seller_Name'] as String?,
    propertyLocation: json['Property_Location'] as String?,
    lawyerName: json['lawyer_Name'] as String?,
    propertyPrice: json['Property_Price'] as String?,
    paymentMethod: json['Payment_Method'] as String?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    requestFromAdmin:
        json['request_from_admin'] == null
            ? null
            : RequestFromAdmin.fromJson(
              json['request_from_admin'] as Map<String, dynamic>,
            ),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'request_from_admin_id': requestFromAdminId,
    'Seller_Name': sellerName,
    'Property_Location': propertyLocation,
    'lawyer_Name': lawyerName,
    'Property_Price': propertyPrice,
    'Payment_Method': paymentMethod,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'request_from_admin': requestFromAdmin?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      requestFromAdminId,
      sellerName,
      propertyLocation,
      lawyerName,
      propertyPrice,
      paymentMethod,
      createdAt,
      updatedAt,
      requestFromAdmin,
    ];
  }
}
