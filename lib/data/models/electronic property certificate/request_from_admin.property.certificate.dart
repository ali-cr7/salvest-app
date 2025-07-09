import 'package:equatable/equatable.dart';

class RequestFromAdmin extends Equatable {
  final int? id;
  final int? requestFromExpertId;
  final int? propertyForSaleId;
  final String? status;
  final String? typeRequest;
  final String? frontImage;
  final String? backImage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const RequestFromAdmin({
    this.id,
    this.requestFromExpertId,
    this.propertyForSaleId,
    this.status,
    this.typeRequest,
    this.frontImage,
    this.backImage,
    this.createdAt,
    this.updatedAt,
  });

  factory RequestFromAdmin.fromJson(Map<String, dynamic> json) {
    return RequestFromAdmin(
      id: json['id'] as int?,
      requestFromExpertId: json['request_from_expert_id'] as int?,
      propertyForSaleId: json['property_for_sale_id'] as int?,
      status: json['status'] as String?,
      typeRequest: json['type_request'] as String?,
      frontImage: json['front_image'] as String?,
      backImage: json['back_image'] as String?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'request_from_expert_id': requestFromExpertId,
    'property_for_sale_id': propertyForSaleId,
    'status': status,
    'type_request': typeRequest,
    'front_image': frontImage,
    'back_image': backImage,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      requestFromExpertId,
      propertyForSaleId,
      status,
      typeRequest,
      frontImage,
      backImage,
      createdAt,
      updatedAt,
    ];
  }
}
