import 'package:equatable/equatable.dart';
import 'package:salvest_app/data/models/lines%20chart/data.chart.dart';

abstract class LinesChartState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LinesChartInitial extends LinesChartState {}

class LinesChartLoading extends LinesChartState {}

class LinesChartLoaded extends LinesChartState {
  final LinesChart data;
  LinesChartLoaded(this.data);
  @override
  List<Object?> get props => [data];
}

class LinesChartError extends LinesChartState {
  final String message;
  LinesChartError(this.message);
  @override
  List<Object?> get props => [message];
}
