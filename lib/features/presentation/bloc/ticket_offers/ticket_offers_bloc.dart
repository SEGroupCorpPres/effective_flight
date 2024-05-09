import 'package:effective_flight/core/api_service.dart';
import 'package:effective_flight/features/domain/entities/tickets_offers_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticket_offers_event.dart';
part 'ticket_offers_state.dart';

class TicketOffersBloc extends Bloc<TicketOffersEvent, TicketOffersState> {
  final ApiService apiService;

  TicketOffersBloc(this.apiService) : super(TicketOffersLoading()) {
    on<FetchTicketOffers>(
      (event, emit) async {
        emit(TicketOffersLoading());
        try {
          final TicketsOffers ticketOffers = await apiService.getTicketOffers();
          emit(TicketOffersLoaded(ticketOffers));
        } catch (error) {
          emit(TicketOffersError(error.toString()));
        }
      },
    );
  }
}
