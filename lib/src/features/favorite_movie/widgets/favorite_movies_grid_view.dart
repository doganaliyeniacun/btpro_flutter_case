import 'package:btpro_flutter_case/src/features/favorite_movie/model/favorite_movie.dart';
import 'package:flutter/material.dart';
import '../../../product/resources/app_values.dart';
import 'favorite_movie_grid_card.dart';



class FavoriteMoviesGridView extends StatelessWidget {
  const FavoriteMoviesGridView({
    super.key,
    required this.movies,
  });

  final List<FavoriteMovie> movies;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.P_12),
        itemCount: movies.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: _gridDelegate(),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return FavoriteMovieGridCard(movie: movie);
        },
      ),
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
