import 'package:equatable/equatable.dart';

class ProfitPercentages extends Equatable {
  final int? m1;
  final int? m2;
  final int? m3;
  final int? m4;
  final int? m5;
  final int? m6;
  final int? m7;
  final int? m8;
  final int? m9;
  final int? m10;
  final int? m11;
  final int? m12;

  const ProfitPercentages({
    this.m1,
    this.m2,
    this.m3,
    this.m4,
    this.m5,
    this.m6,
    this.m7,
    this.m8,
    this.m9,
    this.m10,
    this.m11,
    this.m12,
  });

  factory ProfitPercentages.fromJson(Map<String, dynamic> json) {
    return ProfitPercentages(
      m1: json['1'] as int?,
      m2: json['2'] as int?,
      m3: json['3'] as int?,
      m4: json['4'] as int?,
      m5: json['5'] as int?,
      m6: json['6'] as int?,
      m7: json['7'] as int?,
      m8: json['8'] as int?,
      m9: json['9'] as int?,
      m10: json['10'] as int?,
      m11: json['11'] as int?,
      m12: json['12'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    '11': 11,
    '12': 12,
  };

  @override
  List<Object?> get props => [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
}
