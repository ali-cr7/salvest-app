import 'package:equatable/equatable.dart';
import 'package:salvest_app/data/models/investment/datum.mode.dart';

abstract class InvestmentModeState extends Equatable {
  @override
  List<Object?> get props => [];
}

/// الحالة الابتدائية قبل أي تحميل
class InvestmentModeInitial extends InvestmentModeState {}

/// أثناء التحميل
class InvestmentModeLoading extends InvestmentModeState {}

/// عند النجاح: تحتوي على القائمة
class InvestmentModeLoaded extends InvestmentModeState {
  final List<InvestmentMode> modes;
  InvestmentModeLoaded(this.modes);

  @override
  List<Object?> get props => [modes];
}

/// عند الفشل: رسالة الخطأ
class InvestmentModeError extends InvestmentModeState {
  final String message;
  InvestmentModeError(this.message);

  @override
  List<Object?> get props => [message];
}
