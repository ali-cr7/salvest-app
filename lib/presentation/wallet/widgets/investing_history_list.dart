import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salvest_app/business_logic/investing%20history%20bloc/inveseting_history_bloc.dart';
import 'package:salvest_app/presentation/help/widgets/faq_item_shimmer.dart';
import 'package:salvest_app/presentation/wallet/widgets/wallet_listview_item.dart';
import 'package:salvest_app/utility/app_assests.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class InvestingHistoryList extends StatefulWidget {
  const InvestingHistoryList({super.key});

  @override
  State<InvestingHistoryList> createState() => _InvestingHistoryListState();
}

class _InvestingHistoryListState extends State<InvestingHistoryList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<InvesetingHistoryBloc>().add(GetInvestingHistory(page: 1));

    _scrollController.addListener(() {
      if (_scrollController.position.maxScrollExtent ==
          _scrollController.offset) {
        final state = context.read<InvesetingHistoryBloc>().state;
        if (state is InvesetingHistorySuccess && !state.hasReachedMax) {
          final nextPage =
              (state.investedProprties.length ~/ 5) + 1; // adjust limit
          context.read<InvesetingHistoryBloc>().add(
            GetInvestingHistory(page: nextPage),
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
            reverse: false,
            itemCount: 8,
            itemBuilder: (context, index) => const FAQShimmerItem(),
          );
        }

        if (state is InvesetingHistorySuccess &&
            state.investedProprties.isEmpty) {
          return SomethingWrongWidget(
            title: "No investments found!",
            svgPath: 'assets/images/search.svg',
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh",
              onPressed:
                  () => context.read<InvesetingHistoryBloc>().add(
                    GetInvestingHistory(page: 1),
                  ),
            ),
          );
        }

        if (state is InvesetingHistorySuccess) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<InvesetingHistoryBloc>().add(
                GetInvestingHistory(page: 1),
              );
            },
            child: ListView.builder(
              reverse: false,
              controller: _scrollController,
              physics: const ClampingScrollPhysics(),
              itemCount:
                  state.hasReachedMax
                      ? state.investedProprties.length
                      : state.investedProprties.length + 1,
              itemBuilder: (context, index) {
                //    final item = state.investedProprties[index];
                if (index >= state.investedProprties.length) {
                  if (state.hasReachedMax) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(child: Text("No more items")),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 8,
                    ),
                    child: const FAQShimmerItem(),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 8,
                    ),
                    child: WalletListViewItem(
                      itemColor: const Color(0x3F9A8AEC),
                      date: formatJoinedDate(
                        state.investedProprties[index].createdAt!,
                      ),
                      iconAsset: AppAssets.investmentBlueSvg,
                      mainText:
                          '${state.investedProprties[index].amountPayed}\$ invested in ${state.investedProprties[index].propertyType}-${state.investedProprties[index].exactPosition}',
                    ),
                  ),
                );
              },
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
                  GetInvestingHistory(page: 1),
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
