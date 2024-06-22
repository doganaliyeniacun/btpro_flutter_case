// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_not_found.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieNotFound _$MovieNotFoundFromJson(Map<String, dynamic> json) =>
    MovieNotFound(
      response: json['Response'] as String?,
      error: json['Error'] as String?,
    );

Map<String, dynamic> _$MovieNotFoundToJson(MovieNotFound instance) =>
    <String, dynamic>{
      'Response': instance.response,
      'Error': instance.error,
    };
