import 'package:find_space_station/data/models/iss_model/iss_position.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  IssPosition? iss_position;
  int? timestamp;
  String? message;

  Data({
    this.iss_position,
    this.timestamp,
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
