part of 'help_bloc.dart';

@immutable
sealed class HelpEvent {}
class GetFqmEvent extends HelpEvent{
  @override
  List<Object?> get props => [];

}
