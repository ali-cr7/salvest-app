part of 'offered_properties_bloc.dart';

@immutable
sealed class OfferedPropertiesEvent {}

class GetOfferedPropertiesEvent extends OfferedPropertiesEvent{
  @override
  List<Object?> get props => [];

}
