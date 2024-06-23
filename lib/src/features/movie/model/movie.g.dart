// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      title: json['Title'] as String?,
      year: json['Year'] as String?,
      rated: json['Rated'] as String?,
      released: json['Released'] as String?,
      runtime: json['Runtime'] as String?,
      genre: json['Genre'] as String?,
      director: json['Director'] as String?,
      writer: json['Writer'] as String?,
      actors: json['Actors'] as String?,
      plot: json['Plot'] as String?,
      language: json['Language'] as String?,
      country: json['Country'] as String?,
      awards: json['Awards'] as String?,
      poster: json['Poster'] as String?,
      ratings: (json['Ratings'] as List<dynamic>?)
          ?.map((e) => Rating.fromJson(e as Map<String, dynamic>))
          .toList(),
      metascore: json['Metascore'] as String?,
      imdbRating: json['imdbRating'] as String?,
      imdbVotes: json['imdbVotes'] as String?,
      imdbId: json['imdbID'] as String?,
      type: json['Type'] as String?,
      dvd: json['DVD'] as String?,
      boxOffice: json['BoxOffice'] as String?,
      production: json['Production'] as String?,
      website: json['Website'] as String?,
      response: json['Response'] as String?,
      error: json['Error'] as String?,
    );

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      source: json['Source'] as String?,
      value: json['Value'] as String?,
    );
