import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salvest_app/business_logic/sale%20property%20bloc/sale_property_bloc.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';
import 'package:salvest_app/presentation/sale%20estate/widgets/custom_button.dart' show CustomSendButton;

class SendPropertyButton extends StatelessWidget {
  const SendPropertyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, bottom: 8.0),
      child:
          BlocBuilder<SalePropertyBloc, SalePropertyState>(
            builder: (context, state) {
              print('Rebuilding with stat2e: $state');
              return CustomSendButton(
                buttonName: 'send',
                onTap: () {
                  context.read<SendPropertyBloc>().add(
                    SendPropertyApiEvent(
                      salePropertyState: state,
                    ),
                  );
                },
              );
            },
          ),
    );
  }
}
