import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/wallet%20bloc/wallet_bloc.dart';
import 'package:salvest_app/utility/router.dart';

class StripePaymentScreen extends StatefulWidget {
  @override
  State<StripePaymentScreen> createState() => _StripePaymentScreenState();
}

class _StripePaymentScreenState extends State<StripePaymentScreen> {
  final TextEditingController amountController = TextEditingController();
  void _pay(String token, int amount) async {
    context.read<WalletBloc>().add(
      ChargeInvestmentWalletEvent(
        amount: amount * 100, // Convert to cents
        token: token,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<WalletBloc, WalletState>(
      listener: (context, state) {
        if (state is WalletChargeSuccess) {
          EasyLoading.showSuccess(state.message);
          GoRouter.of(context).pop(AppRouter.kHomePageView);
        }
        if (state is WalletChargeFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.helperResponse.response ?? 'Payment failed'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Charge Wallet')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: amountController,
                decoration: InputDecoration(
                  labelText: 'Amount (USD)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              CardFormField(
                onCardChanged: (details) {},
                style: CardFormStyle(
                  borderColor: Colors.grey,
                  borderRadius: 12,
                  textColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<WalletBloc, WalletState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed:
                        state is WalletChargeLoading
                            ? null
                            : () => _handlePayment(),
                    child:
                        state is WalletChargeLoading
                            ? CircularProgressIndicator()
                            : Text('Charge Wallet'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handlePayment() async {
    final amount = int.tryParse(amountController.text);
    if (amount == null || amount <= 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Enter valid amount')));
      return;
    }

    try {
      EasyLoading.show(status: 'loading...');
      final token = await Stripe.instance.createToken(
        const CreateTokenParams.card(
          params: CardTokenParams(type: TokenType.Card, currency: 'usd'),
        ),
      );
      EasyLoading.dismiss();
      _pay(token.id, amount);
      print('tokin.id:${token.id}');
    } catch (e) {
      print(e);
      EasyLoading.dismiss();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }
}
