import 'package:json_annotation/json_annotation.dart';

part 'iss_position.g.dart';

@JsonSerializable()
class IssPosition {
  String? latitude;
  String? longitude;

  IssPosition({this.latitude, this.longitude});

  factory IssPosition.fromJson(Map<String, dynamic> json) => _$IssPositionFromJson(json);

  Map<String, dynamic> toJson() => _$IssPositionToJson(this);
}
