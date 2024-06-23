import 'package:btpro_flutter_case/src/features/movie/widgets/movie_grid_card.dart';
import 'package:flutter/material.dart';

import '../../../product/resources/app_values.dart';
import '../model/movie.dart';

class MoviesGridView extends StatelessWidget {
  const MoviesGridView({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

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
          return MovieGridCard(movie: movie);
        },
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      childAspectRatio: 0.55,
    );
  }
}
