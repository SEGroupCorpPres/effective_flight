// To parse this JSON data, do
//
//     final ticketsOffers = ticketsOffersFromJson(jsonString);

import 'package:effective_flight/features/domain/entities/price_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'tickets_offers_model.g.dart';

TicketsOffers ticketsOffersFromJson(String str) => TicketsOffers.fromJson(json.decode(str));

String ticketsOffersToJson(TicketsOffers data) => json.encode(data.toJson());

@JsonSerializable()
class TicketsOffers {
  @JsonKey(name: "tickets_offers")
  final List<TicketsOfferItem> ticketsOffersItem;

  TicketsOffers({
    required this.ticketsOffersItem,
  });

  factory TicketsOffers.fromJson(Map<String, dynamic> json) => _$TicketsOffersFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsOffersToJson(this);
}

@JsonSerializable()
class TicketsOfferItem {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "time_range")
  final List<String> timeRange;
  @JsonKey(name: "price")
  final Price price;

  TicketsOfferItem({
    required this.id,
    required this.title,
    required this.timeRange,
    required this.price,
  });

  factory TicketsOfferItem.fromJson(Map<String, dynamic> json) => _$TicketsOfferItemFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsOfferItemToJson(this);
}

