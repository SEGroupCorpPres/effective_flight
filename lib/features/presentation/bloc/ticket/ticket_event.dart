
part of 'ticket_bloc.dart';
abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object?> get props => [];
}

class FetchTickets extends TicketEvent {}
