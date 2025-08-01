import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'withdraw_money_event.dart';
part 'withdraw_money_state.dart';

class WithdrawMoneyBloc extends Bloc<WithdrawMoneyEvent, WithdrawMoneyState> {
  WithdrawMoneyBloc() : super(const WithdrawMoneyState()) {
    on<UpdateWithdrawAmountEvent>((event, emit) {
      emit(state.copyWith(amount: event.amount.toInt()));
    });

    on<UpdateWithdrawMethodEvent>((event, emit) {
      emit(state.copyWith(method: event.method, methodDetails: {})); 
    });

    on<UpdateFullNameEvent>((event, emit) {
      final newDetails = Map<String, dynamic>.from(state.methodDetails);
      newDetails['Full_name'] = event.fullName;
      emit(state.copyWith(methodDetails: newDetails));
    });

    on<UpdatePhoneEvent>((event, emit) {
      final newDetails = Map<String, dynamic>.from(state.methodDetails);
      newDetails['Phone_or_ID_number'] = event.phone;
      emit(state.copyWith(methodDetails: newDetails));
    });

    on<UpdateStateEvent>((event, emit) {
      final newDetails = Map<String, dynamic>.from(state.methodDetails);
      newDetails['State'] = event.stateField;
      emit(state.copyWith(methodDetails: newDetails));
    });

    // If using bank:
    on<UpdateCardNumberEvent>((event, emit) {
      final newDetails = Map<String, dynamic>.from(state.methodDetails);
      newDetails['Card_number'] = event.cardNumber;
      emit(state.copyWith(methodDetails: newDetails));
    });

    on<UpdateAccountHolderNameEvent>((event, emit) {
      final newDetails = Map<String, dynamic>.from(state.methodDetails);
      newDetails['Account_holder_name'] = event.accountHolderName;
      emit(state.copyWith(methodDetails: newDetails));
    });

    // If using crypto:
    on<UpdateWalletAddressEvent>((event, emit) {
      final newDetails = Map<String, dynamic>.from(state.methodDetails);
      newDetails['Wallet_address'] = event.walletAddress;
      emit(state.copyWith(methodDetails: newDetails));
    });
  }
}


