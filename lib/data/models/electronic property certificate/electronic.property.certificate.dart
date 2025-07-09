import 'package:equatable/equatable.dart';

import 'datum.property.certificate.dart';

class ElectronicResponse extends Equatable {
  final String? message;
  final List<Electronic>? data;

  const ElectronicResponse({this.message, this.data});

  factory ElectronicResponse.fromJson(Map<String, dynamic> json) =>
      ElectronicResponse(
        message: json['message'] as String?,
        data:
            (json['data'] as List<dynamic>?)
                ?.map((e) => Electronic.fromJson(e as Map<String, dynamic>))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
  };

  @override
  List<Object?> get props => [message, data];
}
