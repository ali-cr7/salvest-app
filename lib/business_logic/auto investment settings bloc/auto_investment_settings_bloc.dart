import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'auto_investment_settings_event.dart';
part 'auto_investment_settings_state.dart';

class AutoInvestmentSettingsBloc extends Bloc<AutoInvestmentSettingsEvent, AutoInvestmentSettingsState> {
  AutoInvestmentSettingsBloc() : super(const AutoInvestmentSettingsState()) {
    on<UpdateInvestmentAmountEvent>((event, emit) {
      emit(state.copyWith(investmentAmount: event.amount));
    });

    on<UpdateInvestmentModeEvent>((event, emit) {
      emit(state.copyWith(investmentMode: event.mode));
    });

    on<UpdateExpectedProfitMinEvent>((event, emit) {
      emit(state.copyWith(expectedProfitMin: event.min));
    });

    on<UpdateExpectedProfitMaxEvent>((event, emit) {
      emit(state.copyWith(expectedProfitMax: event.max));
    });

    on<UpdateMinChanceInvestedEvent>((event, emit) {
      emit(state.copyWith(minChanceInvested: event.min));
    });

    on<UpdateMaxChanceInvestedEvent>((event, emit) {
      emit(state.copyWith(maxChanceInvested: event.max));
    });
  }
} 
