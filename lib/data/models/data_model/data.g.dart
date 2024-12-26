// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      iss_position: json['iss_position'] == null
          ? null
          : IssPosition.fromJson(json['iss_position'] as Map<String, dynamic>),
      timestamp: (json['timestamp'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'iss_position': instance.iss_position,
      'timestamp': instance.timestamp,
      'message': instance.message,
    };
