import 'dart:convert';

class MethodDetails {
  String? walletAddress;
  String? state;
  String? phoneorIDnumber;
  String? fullname;
  String? accountholdername;
  String? cardNumber;
  MethodDetails({
    this.walletAddress,
    this.accountholdername,
    this.fullname,
    this.phoneorIDnumber,
    this.state,
    this.cardNumber,
  });

  factory MethodDetails.from1(
    Map<String, dynamic> data,
  ) {
    return MethodDetails(
      walletAddress: data['Wallet_address'] as String? ?? ' ',
      accountholdername: data['Account_holder_name'] as String? ?? ' ',
      fullname: data['Full_name'] as String? ?? ' ',
      phoneorIDnumber: data['Phone_or_ID_number'] as String? ?? ' ',
      state: data['State'] as String? ?? ' ',
      cardNumber: data['Card_number'] as String? ?? ' ',
    );
  }

  Map<String, dynamic>
  to1() {
    return {
      'Wallet_address': walletAddress,
      'Account_holder_name': accountholdername,
      'Full_name': fullname,
      'Phone_or_ID_number': phoneorIDnumber,
      'State': state,
      'Card_number': cardNumber
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MethodDetails].
  factory MethodDetails.fromJson(String data) {
    return MethodDetails.from1(
      json.decode(data) as Map<String, dynamic>,
    );
  }

  /// `dart:convert`
  ///
  /// Converts [MethodDetails] to a JSON string.
  String toJson() => json.encode(
    to1(),
  );
}
