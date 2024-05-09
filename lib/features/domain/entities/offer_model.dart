// To parse this JSON data, do
//
//     final offer = offerFromJson(jsonString);

import 'package:effective_flight/features/domain/entities/price_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'offer_model.g.dart';

Offers offersFromJson(String str) => Offers.fromJson(json.decode(str));

String offersToJson(Offers data) => json.encode(data.toJson());

@JsonSerializable()
class Offers {
  @JsonKey(name: "offers")
  final List<OfferItem> offersItem;

  Offers({
    required this.offersItem,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);

  Map<String, dynamic> toJson() => _$OffersToJson(this);
}

@JsonSerializable()
class OfferItem {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "town")
  final String town;
  @JsonKey(name: "price")
  final Price price;

  OfferItem({
    required this.id,
    required this.title,
    required this.town,
    required this.price,
  });

  factory OfferItem.fromJson(Map<String, dynamic> json) => _$OfferItemFromJson(json);

  Map<String, dynamic> toJson() => _$OfferItemToJson(this);
}
