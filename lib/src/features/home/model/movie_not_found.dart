import 'package:json_annotation/json_annotation.dart';

part 'movie_not_found.g.dart';

@JsonSerializable()
class MovieNotFound {
  @JsonKey(name: 'Response')
  final String? response;
  @JsonKey(name: 'Error')
  final String? error;

  MovieNotFound({
    this.response,
    this.error,
  });

  factory MovieNotFound.fromJson(Map<String, dynamic> json) =>
      _$MovieNotFoundFromJson(json);
}
