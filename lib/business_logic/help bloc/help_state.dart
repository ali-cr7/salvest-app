part of 'help_bloc.dart';

@immutable
sealed class HelpState {}

final class HelpInitial extends HelpState {}

final class FaqInLoadingState extends HelpState {}

final class FaqLoadingFailure extends HelpState {
  final HelperResponse helperResponse; 

  FaqLoadingFailure({required this.helperResponse});
}

final class FaqDoneState extends HelpState {
  final FaqRespone faqRespone;

  FaqDoneState({required this.faqRespone});
}
