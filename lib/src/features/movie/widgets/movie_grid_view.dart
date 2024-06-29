import 'package:btpro_flutter_case/src/features/movie/widgets/movie_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../product/navigation/app_routes.dart';
import '../../../product/resources/app_values.dart';
import '../model/movie.dart';

class MovieGridView extends StatelessWidget {
  const MovieGridView({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.P_12),
      itemCount: movies.length,
      physics: const BouncingScrollPhysics(),
      gridDelegate: _gridDelegate(),
      itemBuilder: (context, index) {
        final movie = movies[index];

        onTap() => Get.toNamed(
              AppRoutes.MOVIE_DETAIL,
              arguments: movie.imdbId,
            );

        return MovieGridCard(
          imageUrl: movie.poster,
          title: movie.title,
          onTap: onTap,
        );
      },
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
