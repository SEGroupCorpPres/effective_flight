import 'package:effective_flight/core/api_service.dart';
import 'package:effective_flight/features/domain/entities/offer_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'offers_event.dart';
part 'offers_state.dart';

class OffersBloc extends Bloc<OffersEvent, OffersState> {
  final ApiService apiService;

  OffersBloc(this.apiService) : super(OffersLoading()) {
    on<FetchOffers>(
      (event, emit) async {
        emit(OffersLoading());
        try {
          Offers offers = await apiService.getOffers();
          print(offers.offersItem);
          emit(OffersLoaded(offers));
        } catch (error) {
          emit(OffersError(error.toString()));
        }
      },
    );
  }
}
