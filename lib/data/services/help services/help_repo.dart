import 'package:salvest_app/business_logic/help%20bloc/help_bloc.dart';
import 'package:salvest_app/business_logic/user%20question%20bloc/user_questions_bloc.dart';

abstract class HelpRepo {
  Future getFqm(GetFqmEvent event);
  Future creatQuestion(CreateQuestionEvnet event);
}
