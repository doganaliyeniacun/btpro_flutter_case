// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  final String? imdbID;
  @JsonKey(name: 'Title')
  final String? title;
  @JsonKey(name: 'Poster')
  final String? poster;
  @JsonKey(name: 'Error')
  final String? error;

  Movie({
    required this.imdbID,
    required this.title,
    required this.poster,
    required this.error,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
