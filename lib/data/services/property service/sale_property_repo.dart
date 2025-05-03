import 'package:salvest_app/business_logic/offered%20properties%20bloc/offered_properties_bloc.dart';
import 'package:salvest_app/business_logic/property%20for%20investment%20bloc/properties_for_investment_bloc.dart';
import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';

abstract class SalePropertyRepo {
  Future saleProperty(SendPropertyApiEvent event);
  Future getOfferdProperties(GetOfferedPropertiesEvent event);
  Future getPropertiesForInvestment(GetPropertiesForInvestmentsEvent event);
}
