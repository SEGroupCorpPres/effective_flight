import 'package:dio/dio.dart';
import 'package:effective_flight/core/constants/constants.dart';
import 'package:effective_flight/features/domain/entities/offer_model.dart';
import 'package:effective_flight/features/domain/entities/ticket_model.dart';
import 'package:effective_flight/features/domain/entities/tickets_offers_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Constants.BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(Constants.GET_TICKETS)
  Future<Tickets> getTickets();

  @GET(Constants.GET_OFFERS)
  Future<Offers> getOffers();

  @GET(Constants.GET_TICKETS_OFFERS)
  Future<TicketsOffers> getTicketOffers();
}
