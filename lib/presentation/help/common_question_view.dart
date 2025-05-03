import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:salvest_app/business_logic/help%20bloc/help_bloc.dart';
import 'package:salvest_app/business_logic/user%20question%20bloc/user_questions_bloc.dart';
import 'package:salvest_app/presentation/help/widgets/faq_item.dart';
import 'package:salvest_app/presentation/help/widgets/faq_item_shimmer.dart';
import 'package:salvest_app/utility/app_colors.dart';
import 'package:salvest_app/utility/dialogs_snackBar.dart';
import 'package:salvest_app/utility/elevated_button_widget.dart';
import 'package:salvest_app/utility/somthing_wrong.dart';

class CommonQuestionView extends StatefulWidget {
  const CommonQuestionView({super.key});

  @override
  State<CommonQuestionView> createState() => _CommonQuestionViewState();
}

class _CommonQuestionViewState extends State<CommonQuestionView> {
  final TextEditingController _questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => GoRouter.of(context).pop(),
        ),
        title: const Text(
          'Common Questions',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<UserQuestionsBloc, UserQuestionsState>(
        listener: (context, state) {
          if (state is UserQuestionsLoading) {
            EasyLoading.show(status: 'loading...');
          }
          if (state is UserQuestionsSuccess) {
            EasyLoading.showSuccess(state.creatQuestionResponse.message!);
          }

          if (state is UserQuestionsFailure) {
            DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context,
              helperResponse: state.helperResponse,
              showServerError: true,
            );
          }
        },
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<HelpBloc, HelpState>(
                builder: (context, state) {
                  if (state is FaqInLoadingState || state is HelpInitial) {
                    return ListView.builder(
                      itemCount: 8,
                      itemBuilder: (context, index) => FAQShimmerItem(),
                    );
                  }

                  if (state is FaqDoneState && state.faqRespone.data!.isEmpty) {
                    return SomethingWrongWidget(
                      title: "No Questions found!",
                      svgPath: 'assets/images/search.svg',
                      elevatedButtonWidget: ElevatedButtonWidget(
                        title: "Refresh",
                        onPressed:
                            () => context.read<HelpBloc>().add(GetFqmEvent()),
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
                              question: faqItem.question!,
                              answer: faqItem.answer!,
                            ),
                          );
                        },
                      ),
                    );
                  }

                  return SomethingWrongWidget(
                    elevatedButtonWidget: ElevatedButtonWidget(
                      title: "Refresh",
                      onPressed:
                          () => context.read<HelpBloc>().add(GetFqmEvent()),
                    ),
                  );
                },
              ),
            ),

            // Add Question Field
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _questionController,
                      decoration: InputDecoration(
                        hintText: 'question',
                        filled: true,
                        fillColor: Colors.grey[200],
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      final question = _questionController.text.trim();
                      if (question.isNotEmpty) {
                        context.read<UserQuestionsBloc>().add(
                          CreateQuestionEvnet(question: question),
                        );
                        _questionController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightBlue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text('Send'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
