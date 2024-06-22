// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      imdbID: json['imdbID'] as String?,
      title: json['Title'] as String?,
      poster: json['Poster'] as String?,
      error: json['Error'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'imdbID': instance.imdbID,
      'Title': instance.title,
      'Poster': instance.poster,
      'Error': instance.error,
    };
