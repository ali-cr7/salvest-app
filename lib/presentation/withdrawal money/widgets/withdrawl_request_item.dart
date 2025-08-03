import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salvest_app/data/models/my_withdrawls_requests/method_details.dart';
import 'package:salvest_app/utility/app_colors.dart';

class WithdrawRequestItem extends StatelessWidget {
  //final Map<String, dynamic> data;
  final String method;
  final String amount;
  final MethodDetails methodDetails;
  final String createdAt;
  final String trx;
  final String status;

  const WithdrawRequestItem({super.key, required this.method, required this.amount, required this.methodDetails, required this.createdAt, required this.trx, required this.status});

  Color getStatusColor(String status) {
    switch (status) {
      case 'pending':
        return Colors.orange;
      case 'processed':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String formatDate(String? isoDate) {
    if (isoDate == null) return '-';
    try {
      final dateTime = DateTime.parse(isoDate).toLocal();
      return DateFormat.yMMMd().add_jm().format(dateTime);
    } catch (_) {
      return isoDate;
    }
  }

  List<Widget> buildDetails(String method, MethodDetails details) {
    switch (method) {
      case 'bank':
        return [
          Text('Card: ${details.cardNumber?? ''}'),
          Text('Account Holder: ${details.accountholdername?? ''}'),
        ];
      case 'crypto':
        return [Text('Wallet: ${details.walletAddress?? ''}')];
      case 'harem':
      case 'western_union':
        return [
          Text('Name: ${details.fullname ?? ''}'),
          Text('Phone/ID: ${details.phoneorIDnumber?? ''}'),
          Text('State: ${details.state ?? ''}'),
        ];
      default:
        return [const Text('Unknown method')];
    }
  }

  @override
  Widget build(BuildContext context) {
    // final method = data['method'] ?? 'N/A';
    // final amount = data['amount'] ?? '0';
    // final methodDetails = Map<String, dynamic>.from(
    //   data['method_details'] ?? {},
    // );
    // final status = data['status'] ?? 'unknown';
    // final createdAt = formatDate(data['created_at']);
    // final trx = data['transaction_reference'] ?? '-';

    return Card(
      color: AppColors.green15,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Amount + Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$amount SYP',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Chip(
                  label: Text(status.toUpperCase()),
                  backgroundColor: getStatusColor(status).withOpacity(0.1),
                  labelStyle: TextStyle(color: getStatusColor(status)),
                ),
              ],
            ),
            const SizedBox(height: 8),

            /// Method + Created At
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Method: ${method.toUpperCase()}'),
                Text(
                  'Requested: $createdAt',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const Divider(height: 20),

            /// Method Details
            ...buildDetails(method, methodDetails),

            if (trx != '-')
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text('Transaction Ref: $trx'),
              ),
          ],
        ),
      ),
    );
  }
}
