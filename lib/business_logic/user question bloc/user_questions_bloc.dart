import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:salvest_app/data/models/creat_question_response/creat_question_response.dart';
import 'package:salvest_app/data/services/help%20services/help_repo_impl.dart';
import 'package:salvest_app/utility/api_config/api_service.dart';

part 'user_questions_event.dart';
part 'user_questions_state.dart';

class UserQuestionsBloc extends Bloc<UserQuestionsEvent, UserQuestionsState> {
  final HelpRepoImpl helpRepoImpl;
  UserQuestionsBloc(this.helpRepoImpl) : super(UserQuestionsInitial()) {
    on<CreateQuestionEvnet>((event, emit) async {
      emit(UserQuestionsLoading());
      final response = await helpRepoImpl.creatQuestion(event);
      if (response is CreatQuestionResponse) {
        emit(UserQuestionsSuccess(creatQuestionResponse: response));
      } else {
        emit(UserQuestionsFailure(helperResponse: response));
      }
    });
  }
}
