part of 'user_questions_bloc.dart';

@immutable
sealed class UserQuestionsEvent {}
class CreateQuestionEvnet extends UserQuestionsEvent {
  CreateQuestionEvnet({required this.question, });

  final String question;
  

  // @override
  // List<Object?> get props => [question];
}