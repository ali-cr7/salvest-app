import 'package:equatable/equatable.dart';

abstract class LinesChartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// يرسل السنة المراد جلب بياناتها
class FetchLinesChartEvent extends LinesChartEvent {
  final int year;
  FetchLinesChartEvent({required this.year});
  @override
  List<Object?> get props => [year];
}
