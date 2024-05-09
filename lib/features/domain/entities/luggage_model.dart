import 'package:effective_flight/features/domain/entities/price_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'luggage_model.g.dart';

@JsonSerializable()
class Luggage {
  @JsonKey(name: "has_luggage")
  final bool hasLuggage;
  @JsonKey(name: "price")
  final Price? price;

  Luggage({
    required this.hasLuggage,
    required this.price,
  });

  factory Luggage.fromJson(Map<String, dynamic> json) => _$LuggageFromJson(json);

  Map<String, dynamic> toJson() => _$LuggageToJson(this);
}
