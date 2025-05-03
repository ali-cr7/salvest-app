part of 'user_questions_bloc.dart';

@immutable
sealed class UserQuestionsState {}

final class UserQuestionsInitial extends UserQuestionsState {}

final class UserQuestionsLoading extends UserQuestionsState {}

final class UserQuestionsSuccess extends UserQuestionsState {
  final CreatQuestionResponse creatQuestionResponse;

  UserQuestionsSuccess({required this.creatQuestionResponse});
}

final class UserQuestionsFailure extends UserQuestionsState {
  final HelperResponse helperResponse;

  UserQuestionsFailure({required this.helperResponse});
}
