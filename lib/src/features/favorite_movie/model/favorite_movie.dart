import 'package:hive/hive.dart';

part 'favorite_movie.g.dart';

@HiveType(typeId: 0)
class FavoriteMovie extends HiveObject {
  @HiveField(0)
  late String imdbId;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String imageUrl;

  @HiveField(3)
  late bool isFavorite;

  FavoriteMovie({
    required this.imdbId,
    required this.title,
    required this.imageUrl,
    required this.isFavorite,
  });
}
