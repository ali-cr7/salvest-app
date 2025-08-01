part of 'withdraw_money_bloc.dart';

@immutable
abstract class WithdrawMoneyEvent {}

class UpdateWithdrawAmountEvent extends WithdrawMoneyEvent {
  final double amount;

  UpdateWithdrawAmountEvent(this.amount);
}

class UpdateWithdrawMethodEvent extends WithdrawMoneyEvent {
  final String method;

  UpdateWithdrawMethodEvent(this.method);
}

class UpdateFullNameEvent extends WithdrawMoneyEvent {
  final String fullName;

  UpdateFullNameEvent(this.fullName);
}

class UpdatePhoneEvent extends WithdrawMoneyEvent {
  final String phone;

  UpdatePhoneEvent(this.phone);
}

class UpdateStateEvent extends WithdrawMoneyEvent {
  final String stateField;

  UpdateStateEvent(this.stateField);
}
class UpdateCardNumberEvent extends WithdrawMoneyEvent {
  final String cardNumber;
  UpdateCardNumberEvent(this.cardNumber);
}

class UpdateAccountHolderNameEvent extends WithdrawMoneyEvent {
  final String accountHolderName;
  UpdateAccountHolderNameEvent(this.accountHolderName);
}

class UpdateWalletAddressEvent extends WithdrawMoneyEvent {
  final String walletAddress;
  UpdateWalletAddressEvent(this.walletAddress);
}