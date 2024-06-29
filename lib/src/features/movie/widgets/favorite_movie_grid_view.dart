import 'package:btpro_flutter_case/src/features/movie/widgets/movie_grid_card.dart';
import 'package:flutter/material.dart';

import 'package:btpro_flutter_case/src/features/movie/model/favorite_movie.dart';
import 'package:get/get.dart';
import '../../../product/resources/app_values.dart';
import '../view_model/favorite_movie_view_model.dart';

class FavoriteMovieGridView extends StatelessWidget {
  const FavoriteMovieGridView({
    super.key,
    required this.movies,
  });

  final List<FavoriteMovie> movies;

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<FavoriteMovieViewModel>();

    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.P_12),
      itemCount: movies.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: _gridDelegate(),
      itemBuilder: (context, index) {
        final movie = movies[index];

        return MovieGridCard(
          imageUrl: movie.imageUrl,
          title: movie.title,
          isFavorite: movie.isFavorite,
          onFavoriteTap: () => vm.unFavoriteMovie(movie.imdbId),
        );
      },
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 25,
      childAspectRatio: 0.55,
    );
  }
}
