// To parse this JSON data, do
//
//     final tickets = ticketsFromJson(jsonString);

import 'package:effective_flight/features/domain/entities/arrival_model.dart';
import 'package:effective_flight/features/domain/entities/hand_luggage_model.dart';
import 'package:effective_flight/features/domain/entities/luggage_model.dart';
import 'package:effective_flight/features/domain/entities/price_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'ticket_model.g.dart';

Tickets ticketsFromJson(String str) => Tickets.fromJson(json.decode(str));

String ticketsToJson(Tickets data) => json.encode(data.toJson());

@JsonSerializable()
class Tickets {
  @JsonKey(name: "tickets")
  final List<Ticket> tickets;

  Tickets({
    required this.tickets,
  });

  factory Tickets.fromJson(Map<String, dynamic> json) => _$TicketsFromJson(json);

  Map<String, dynamic> toJson() => _$TicketsToJson(this);
}

@JsonSerializable()
class Ticket {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "badge")
  final String? badge;
  @JsonKey(name: "price")
  final Price price;
  @JsonKey(name: "provider_name")
  final String providerName;
  @JsonKey(name: "company")
  final String company;
  @JsonKey(name: "departure")
  final Arrival departure;
  @JsonKey(name: "arrival")
  final Arrival arrival;
  @JsonKey(name: "has_transfer")
  final bool hasTransfer;
  @JsonKey(name: "has_visa_transfer")
  final bool hasVisaTransfer;
  @JsonKey(name: "luggage")
  final Luggage luggage;
  @JsonKey(name: "hand_luggage")
  final HandLuggage handLuggage;
  @JsonKey(name: "is_returnable")
  final bool isReturnable;
  @JsonKey(name: "is_exchangable")
  final bool isExchangable;

  Ticket({
    required this.id,
    required this.badge,
    required this.price,
    required this.providerName,
    required this.company,
    required this.departure,
    required this.arrival,
    required this.hasTransfer,
    required this.hasVisaTransfer,
    required this.luggage,
    required this.handLuggage,
    required this.isReturnable,
    required this.isExchangable,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  Map<String, dynamic> toJson() => _$TicketToJson(this);
}


class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
