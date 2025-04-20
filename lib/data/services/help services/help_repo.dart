import 'package:salvest_app/business_logic/help%20bloc/help_bloc.dart';

abstract class HelpRepo {
  Future getFqm(GetFqmEvent event);
}
