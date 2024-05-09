part of 'ticket_bloc.dart';
abstract class TicketState extends Equatable {
  const TicketState();

  @override
  List<Object?> get props => [];
}

class TicketLoading extends TicketState {}

class TicketLoaded extends TicketState {
  final Tickets tickets;

  const TicketLoaded(this.tickets);

  @override
  List<Object?> get props => [tickets];
}

class TicketError extends TicketState {
  final String message;

  const TicketError(this.message);

  @override
  List<Object?> get props => [message];
}
