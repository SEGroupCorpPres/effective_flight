import 'package:effective_flight/core/api_service.dart';
import 'package:effective_flight/features/domain/entities/ticket_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'ticket_event.dart';
part 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  final ApiService apiService;

  TicketBloc(this.apiService) : super(TicketLoading()) {
    on<FetchTickets>(
      (event, emit) async {
        emit(TicketLoading());
        try {
          final Tickets tickets = await apiService.getTickets();
          emit(TicketLoaded(tickets));
        } catch (error) {
          emit(TicketError(error.toString()));
        }
      },
    );
  }
}
