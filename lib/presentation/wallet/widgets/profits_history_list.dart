import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salvest_app/business_logic/investing%20history%20bloc/inveseting_history_bloc.dart';
import 'package:salvest_app/presentation/help/widgets/faq_item_shimmer.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_listview_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class ProfitsHistoryList extends StatefulWidget {
  const ProfitsHistoryList({super.key});

  @override
  State<ProfitsHistoryList> createState() => _ProfitsHistoryListState();
}

class _ProfitsHistoryListState extends State<ProfitsHistoryList> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    context.read<InvesetingHistoryBloc>().add(
      GetInvestingProfitHistory(page: 1),
    );

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        final state = context.read<InvesetingHistoryBloc>().state;
        if (state is InvesetingHistorySuccess && !state.hasReachedMax) {
          final nextPage =
              (state.investedProprties.length ~/ 5) + 1; // adjust limit
          context.read<InvesetingHistoryBloc>().add(
            GetInvestingProfitHistory(page: nextPage),
          );
        }
      }
    });
  }
  

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InvesetingHistoryBloc, InvesetingHistoryState>(
      builder: (context, state) {
        if (state is InvesetingHistoryLoading ||
            state is InvesetingHistoryInitial) {
          return ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) => FAQShimmerItem(),
          );
        }
        if (state is GetWalletProfitsSuccessState &&
            state.propertyProfits!.isEmpty) {
          return SomethingWrongWidget(
            title: "No Questions found!",
            svgPath: 'assets/images/search.svg',
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh",
              onPressed:
                  () => context.read<InvesetingHistoryBloc>().add(
                    GetInvestingProfitHistory(page: 1),
                  ),
            ),
          );
        }

        if (state is GetWalletProfitsSuccessState) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<InvesetingHistoryBloc>().add(
                GetInvestingProfitHistory(page: 1),
              );
            },
            child: ListView.builder(
              controller: _scrollController,
              itemCount:
                  state.hasReachedMax
                      ? state.propertyProfits!.length
                      : state.propertyProfits!.length + 1,
              itemBuilder: (context, index) {
                if (index >= state.propertyProfits!.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 8,
                    ),
                    child: const FAQShimmerItem(),
                  );
                }
                final item = state.propertyProfits![index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 18,
                  ),
                  child: WalletListViewItem(
                    itemColor: const Color(0x477AF383),
                    date:
                        'Your investment in ${item.propertyType} - ${item.exactPosition}\n'
                        'has been received on ${formatJoinedDate(item.scheduledDate!)}.',
                    iconAsset: AppAssets.cashGreen,
                    mainText:
                        '${item.profitAmount} of investment has been received!',
                  ),
                );
              },

              //  else {
              //   // show loader at the bottom
              //   return state.hasReachedMax
              //       ? const SizedBox.shrink()
              //       : const Padding(
              //         padding: EdgeInsets.symmetric(vertical: 16),
              //         child: Center(child: CircularProgressIndicator()),
              //       );
              // }
            ),
          );
        }
        if (state is InvesetingHistoryFailure) {
          return SomethingWrongWidget(
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh",
              onPressed:
                  () => context.read<InvesetingHistoryBloc>().add(
                    GetInvestingHistory(page: 1),
                  ),
            ),
          );
        }
        return SomethingWrongWidget(
          elevatedButtonWidget: ElevatedButtonWidget(
            title: "Refresh",
            onPressed:
                () => context.read<InvesetingHistoryBloc>().add(
                  GetInvestingProfitHistory(page: 1),
                ),
          ),
        );
      },
    );
  }
}

String formatJoinedDate(String isoDate) {
  try {
    // Parse the ISO date string into a DateTime object
    DateTime date = DateTime.parse(isoDate);

    // Format the date as "d MMMM yyyy" (e.g., "14 April 2025")
    String formattedDate = DateFormat('d MMMM yyyy').format(date);

    return '$formattedDate';
  } catch (e) {
    // Fallback if parsing fails
    return 'joined in Unknown date';
  }
}
