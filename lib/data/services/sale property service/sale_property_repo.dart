import 'package:salvest_app/business_logic/send%20property%20bloc/send_property_bloc.dart';

abstract class SalePropertyRepo {
  Future saleProperty(SendPropertyApiEvent event);
}
