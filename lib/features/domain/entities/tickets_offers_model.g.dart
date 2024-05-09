// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketsOffers _$TicketsOffersFromJson(Map<String, dynamic> json) =>
    TicketsOffers(
      ticketsOffersItem: (json['tickets_offers'] as List<dynamic>)
          .map((e) => TicketsOfferItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TicketsOffersToJson(TicketsOffers instance) =>
    <String, dynamic>{
      'tickets_offers': instance.ticketsOffersItem,
    };

TicketsOfferItem _$TicketsOfferItemFromJson(Map<String, dynamic> json) =>
    TicketsOfferItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      timeRange: (json['time_range'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TicketsOfferItemToJson(TicketsOfferItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'time_range': instance.timeRange,
      'price': instance.price,
    };
