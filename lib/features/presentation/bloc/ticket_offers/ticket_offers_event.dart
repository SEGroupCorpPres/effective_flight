part of 'ticket_offers_bloc.dart';

abstract class TicketOffersEvent extends Equatable {
  const TicketOffersEvent();

  @override
  List<Object?> get props => [];
}

class FetchTicketOffers extends TicketOffersEvent {}
