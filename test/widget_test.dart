// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:effective_flight/core/api_service.dart';
import 'package:effective_flight/core/constants/constants.dart';
import 'package:effective_flight/features/domain/entities/offer_model.dart';
import 'package:effective_flight/features/domain/entities/ticket_model.dart';
import 'package:effective_flight/features/domain/entities/tickets_offers_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Dio dio = Dio(
    BaseOptions(baseUrl: Constants.BASE_URL),
  );

  final ApiService apiService = ApiService(dio);
  test(
    'test',
    () async {
      final Offers offers = await apiService.getOffers();
      final Tickets tickets = await apiService.getTickets();
      final TicketsOffers ticketsOffers = await apiService.getTicketOffers();

      print(offers.offersItem[1].town);
      print(tickets.tickets);
      print(ticketsOffers.ticketsOffersItem);

      // final List<Offer> offers = body.offers;
      // expect(offers, isEmpty);
      // expect(tickets, isNotEmpty);
      // expect(ticketsOffers, isNotEmpty);

    },
  );
}
