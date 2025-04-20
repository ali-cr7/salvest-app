import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/help%20bloc/help_bloc.dart';
import 'package:salvest_app/presentation/help/widgets/faq_item.dart';
import 'package:salvest_app/presentation/help/widgets/faq_item_shimmer.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class CommonQuestionView extends StatefulWidget {
  const CommonQuestionView({super.key});

  @override
  State<CommonQuestionView> createState() => _CommonQuestionViewState();
}

class _CommonQuestionViewState extends State<CommonQuestionView> {
  //   HelpBloc frequentQuesionsBloc = HelpBloc();
  // void search() {
  //     frequentQuesionsBloc.add(ChangeToLoadingApiEvent(

  //     ));
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
        title: const Text(
          'Qommon Question',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: BlocBuilder<HelpBloc, HelpState>(
        builder: (context, state) {
          final deleteUpdate = context.watch<HelpBloc>().state;
          if (deleteUpdate is FaqInLoadingState) {
            return ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return FAQShimmerItem();
              },
            );
          }
          if (state is HelpInitial) {
            return ListView.builder(
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return FAQShimmerItem();
              },
            );
          }
          if (state is FaqDoneState && state.faqRespone.data!.isEmpty) {
            return SomethingWrongWidget(
              title: "No Questions found !",
              svgPath: 'assets/images/search.svg',
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed: () {
                  context.read<HelpBloc>().add(GetFqmEvent());
                },
              ),
            );
          }
          if (state is FaqDoneState) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HelpBloc>().add(GetFqmEvent());
              },
              child: ListView.builder(
                itemCount: state.faqRespone.data!.length,

                itemBuilder: (context, index) {
                  final faqItem = state.faqRespone.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: FAQItem(
                      question:
                          faqItem.question!,
                      answer:
                        faqItem.answer!,
                    ),
                  );
                },
              ),
            );
          }
          return SomethingWrongWidget(
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh",
              onPressed: () {
                context.read<HelpBloc>().add(GetFqmEvent());
              },
            ),
          );
        },
      ),
    );
  }
}
