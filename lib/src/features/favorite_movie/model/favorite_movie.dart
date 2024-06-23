import 'package:hive/hive.dart';

part 'favorite_movie.g.dart';

@HiveType(typeId: 0)
class FavoriteMovie extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String imageUrl;

  @HiveField(2)
  late bool isFavorite;
}