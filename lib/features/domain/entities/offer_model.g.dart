// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offers _$OffersFromJson(Map<String, dynamic> json) => Offers(
      offersItem: (json['offers'] as List<dynamic>)
          .map((e) => OfferItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OffersToJson(Offers instance) => <String, dynamic>{
      'offers': instance.offersItem,
    };

OfferItem _$OfferItemFromJson(Map<String, dynamic> json) => OfferItem(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      town: json['town'] as String,
      price: Price.fromJson(json['price'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferItemToJson(OfferItem instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'town': instance.town,
      'price': instance.price,
    };
