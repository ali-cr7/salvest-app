import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/expert%20negotiation%20bloc/expert_negotiation_bloc.dart';
import 'package:salvest_app/presentation/negotition/widgets/notification_action_button.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/router.dart';

class NegotiationNotificationView extends StatelessWidget {
  const NegotiationNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExpertNegotiationBloc, ExpertNegotiationState>(
      listener: (context, state) {
        if (state is NegotiationLoading) {
          EasyLoading.show(status: 'loading...');
        }

        if (state is AcceptRejectNegotiationSuccess) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(state.message);
          context.read<ExpertNegotiationBloc>().add(
            GetExpertNegotiationEvent(),
          );
        } else if (state is AcceptRejectNegotiationSuccess) {
          EasyLoading.dismiss();
          EasyLoading.showSuccess(state.message);
          context.read<ExpertNegotiationBloc>().add(
            GetExpertNegotiationEvent(),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          title: const Text(
            'Negotiation',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        backgroundColor: AppColors.white,
        body: Center(
          child: BlocBuilder<ExpertNegotiationBloc, ExpertNegotiationState>(
            builder: (context, state) {
              final negotiationState =
                  context.watch<ExpertNegotiationBloc>().state;

              if (negotiationState is ExpertNegotiationLoading) {
                return const CircularProgressIndicator();
              } else if (negotiationState is ExpertNegotiationSuccess) {
                final items = negotiationState.expertNegotiationResponse.data!;
                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Container(
                      width: 348,
                      margin: const EdgeInsets.only(bottom: 16),
                      constraints: const BoxConstraints(minHeight: 243),
                      padding: const EdgeInsets.all(16),
                      decoration: ShapeDecoration(
                        color: AppColors.green15,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Image(
                                  image: AssetImage(AppAssets.negotiationICon),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '${item.textOfTheAgreement!}\nPayment way: ${item.paymentMechanism}\nState: ${item.status}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 90),
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Row(
                              children: [
                                NegotiationActionButton(
                                  label: 'Accept',
                                  backgroundColor: const Color(0x5946E050),
                                  textColor: const Color(0xFF036D0F),
                                  onTap: () {
                                    context.read<ExpertNegotiationBloc>().add(
                                      AcceptExpertNegotiationEvent(
                                        id: item.id.toString(),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 10),
                                NegotiationActionButton(
                                  label: 'Negotiate',
                                  backgroundColor: const Color(0x87786CB9),
                                  textColor: const Color(0xFF685D9F),
                                  onTap: () {
                                    GoRouter.of(context).push(
                                      '${AppRouter.kNegotitionChatView}?userId= user_${item.expertId}&userName=${item.expertName}',
                                    );
                                  },
                                ),
                                const SizedBox(width: 10),
                                NegotiationActionButton(
                                  label: 'Reject',
                                  backgroundColor: const Color(0x3FD9D9D9),
                                  textColor: const Color(0xBFF1272A),
                                  border: const BorderSide(
                                    width: 1,
                                    color: Color(0xBFF1272A),
                                  ),
                                  onTap: () {
                                    context.read<ExpertNegotiationBloc>().add(
                                      RejectExpertNegotiationEvent(
                                        id: item.id.toString(),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (negotiationState is ExpertNegotiationFailure) {
                return Text(negotiationState.helperResponse.response);
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ),
      ),
    );
  }
}
