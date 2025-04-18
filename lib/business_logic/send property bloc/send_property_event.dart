part of 'send_property_bloc.dart';

@immutable
sealed class SendPropertyEvent {}
class SendPropertyApiEvent extends SendPropertyEvent{

  SendPropertyApiEvent({required this.salePropertyState});

final  SalePropertyState salePropertyState;
  @override
  List<Object?> get props => [salePropertyState];

}
