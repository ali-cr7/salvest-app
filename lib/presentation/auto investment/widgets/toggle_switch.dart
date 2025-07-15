import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salvest_app/business_logic/acivate%20investment%20settings%20bloc/activate_auto_ivnestment_bloc.dart';
import 'package:salvest_app/business_logic/auto%20investment%20settings%20bloc/auto_investment_settings_bloc.dart';
import 'package:salvest_app/utility/enums.dart';

class ToggleSwitchWidget extends StatefulWidget {
  const ToggleSwitchWidget({super.key});

  @override
  _ToggleSwitchWidgetState createState() => _ToggleSwitchWidgetState();
}

class _ToggleSwitchWidgetState extends State<ToggleSwitchWidget> {
  bool isActive = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<
      ActivateAutoIvnestmentBloc,
      ActivateAutoIvnestmentState
    >(
      listener: (context, state) {
        if (state is ActicvateAutoInvestmentStatus) {
          final message = state.helperResponse.fullBody!["message"] ?? '';
          final success =
              state.helperResponse.servicesResponse ==
                      ServicesResponseStatues.success
                  ? true
                  : false;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(success ? 'Success: $message' : 'Failed: $message'),
            ),
          );
        }
      },
      builder: (context, state) {
        final isLoading = state is ActivateAutoIvnestmentLoading;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isActive ? "Activated" : "Deactivated",
              style: TextStyle(
                color: isActive ? Colors.green : Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 8),
            BlocBuilder<
              AutoInvestmentSettingsBloc,
              AutoInvestmentSettingsState
            >(
              builder: (context, state) {
                return Switch(
                  value: isActive,
                  activeColor: Colors.black,
                  activeTrackColor: Colors.green.shade200,
                  inactiveThumbColor: Colors.black,
                  inactiveTrackColor: Colors.grey.shade400,
                  onChanged:
                      isLoading
                          ? null
                          : (bool value) {
                            setState(() => isActive = value);
                            final bloc =
                                context.read<ActivateAutoIvnestmentBloc>();

                            if (value) {
                              bloc.add(
                                ActicvateAutoInvestmentApiEvent(
                                  autoInvestmentSettingsState: state,
                                ),
                              );
                            } else {
                              bloc.add(DeActicvateAutoInvestmentApiEvent());
                            }
                          },
                );
              },
            ),
            if (isLoading) const SizedBox(width: 10),
            if (isLoading) const CircularProgressIndicator(strokeWidth: 2),
          ],
        );
      },
    );
  }
}
