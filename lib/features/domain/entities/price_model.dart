
import 'package:json_annotation/json_annotation.dart';

part 'price_model.g.dart';
@JsonSerializable()
class Price {
  @JsonKey(name: "value")
  final int value;

  Price({
    required this.value,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);

  Map<String, dynamic> toJson() => _$PriceToJson(this);
}