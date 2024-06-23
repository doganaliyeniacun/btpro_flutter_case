// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(createToJson: false)
class Movie extends Equatable {
  const Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.poster,
    required this.ratings,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.dvd,
    required this.boxOffice,
    required this.production,
    required this.website,
    required this.response,
    required this.error,
  });

  @JsonKey(name: 'Title')
  final String? title;

  @JsonKey(name: 'Year')
  final String? year;

  @JsonKey(name: 'Rated')
  final String? rated;

  @JsonKey(name: 'Released')
  final String? released;

  @JsonKey(name: 'Runtime')
  final String? runtime;

  @JsonKey(name: 'Genre')
  final String? genre;

  @JsonKey(name: 'Director')
  final String? director;

  @JsonKey(name: 'Writer')
  final String? writer;

  @JsonKey(name: 'Actors')
  final String? actors;

  @JsonKey(name: 'Plot')
  final String? plot;

  @JsonKey(name: 'Language')
  final String? language;

  @JsonKey(name: 'Country')
  final String? country;

  @JsonKey(name: 'Awards')
  final String? awards;

  @JsonKey(name: 'Poster')
  final String? poster;

  @JsonKey(name: 'Ratings')
  final List<Rating>? ratings;

  @JsonKey(name: 'Metascore')
  final String? metascore;
  final String? imdbRating;
  final String? imdbVotes;

  @JsonKey(name: 'imdbID')
  final String? imdbId;

  @JsonKey(name: 'Type')
  final String? type;

  @JsonKey(name: 'DVD')
  final String? dvd;

  @JsonKey(name: 'BoxOffice')
  final String? boxOffice;

  @JsonKey(name: 'Production')
  final String? production;

  @JsonKey(name: 'Website')
  final String? website;

  @JsonKey(name: 'Response')
  final String? response;

  @JsonKey(name: 'Error')
  final String? error;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  @override
  List<Object?> get props => [
        title,
        year,
        rated,
        released,
        runtime,
        genre,
        director,
        writer,
        actors,
        plot,
        language,
        country,
        awards,
        poster,
        ratings,
        metascore,
        imdbRating,
        imdbVotes,
        imdbId,
        type,
        dvd,
        boxOffice,
        production,
        website,
        response,
        error,
      ];
}

@JsonSerializable(createToJson: false)
class Rating extends Equatable {
  const Rating({
    required this.source,
    required this.value,
  });

  @JsonKey(name: 'Source')
  final String? source;

  @JsonKey(name: 'Value')
  final String? value;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  @override
  List<Object?> get props => [
        source,
        value,
      ];
}
