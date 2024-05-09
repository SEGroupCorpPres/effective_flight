part of 'ticket_offers_bloc.dart';

abstract class TicketOffersState extends Equatable {
  const TicketOffersState();

  @override
  List<Object?> get props => [];
}

class TicketOffersLoading extends TicketOffersState {}

class TicketOffersLoaded extends TicketOffersState {
  final TicketsOffers ticketOffers;

  const TicketOffersLoaded(this.ticketOffers);

  @override
  List<Object?> get props => [ticketOffers];
}

class TicketOffersError extends TicketOffersState {
  final String message;

  const TicketOffersError(this.message);

  @override
  List<Object?> get props => [message];
}
