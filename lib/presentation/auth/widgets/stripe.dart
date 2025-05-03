import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';

import 'package:salvest_app/utility/dialogs_snackBar.dart';

class StripeTokenTestScreen extends StatefulWidget {
  const StripeTokenTestScreen({Key? key}) : super(key: key);

  @override
  State<StripeTokenTestScreen> createState() => _StripeTokenTestScreenState();
}

class _StripeTokenTestScreenState extends State<StripeTokenTestScreen> {
  CardFieldInputDetails? _cardFieldInputDetails;
  final TextEditingController _amountController = TextEditingController();
  bool _isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Token Test'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: BlocListener<WalletBloc, WalletState>(
        listener: (context, state) {
          if (state is WalletChargeLoading) {
            setState(() => _isLoading = true);
          } else {
            setState(() => _isLoading = false);
            if (state is WalletChargeSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('✅ ${state.message}')));
            } else if (state is WalletChargeFailure) {
              DialogsWidgetsSnackBar.showSnackBarFromStatus(
                context: context,
                helperResponse: state.helperResponse,
                showServerError: true,
              );
            }
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.credit_card, size: 60, color: Colors.indigo),
                const SizedBox(height: 10),
                const Text(
                  'Enter Card Details & Amount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CardField(
                  onCardChanged: (card) {
                    setState(() {
                      _cardFieldInputDetails = card;
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Card Info',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _createAndSendToken,
                  icon: const Icon(Icons.lock),
                  label:
                      _isLoading
                          ? const SizedBox(
                            height: 18,
                            width: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                          : const Text('Pay & Charge Wallet'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _createAndSendToken() async {
    if (!(_cardFieldInputDetails?.complete ?? false)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please complete the card form')),
      );
      return;
    }

    final amount = int.tryParse(_amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Enter a valid amount')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final tokenData = await Stripe.instance.createToken(
        const CreateTokenParams.card(params: CardTokenParams()),
      );

      // Dispatch Bloc event with the token and amount
      context.read<WalletBloc>().add(
        ChargeInvestmentWalletEvent(amount: amount, token: tokenData.id),
      );
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('❌ Error: $e')));
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }
}
