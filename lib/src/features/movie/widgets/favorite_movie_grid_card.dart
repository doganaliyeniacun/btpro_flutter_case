// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:btpro_flutter_case/src/features/movie/view_model/favorite_movie_view_model.dart';
import 'package:flutter/material.dart';
import 'package:btpro_flutter_case/src/features/movie/model/favorite_movie.dart';
import 'package:btpro_flutter_case/src/product/widgets/favorite_button.dart';
import 'package:get/get.dart';

import '../../../product/resources/app_values.dart';
import '../../../product/widgets/image_with_shimmer.dart';

class FavoriteMovieGridCard extends StatelessWidget {
  const FavoriteMovieGridCard({
    super.key,
    required this.movie,
  });

  final FavoriteMovie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final vm = Get.find<FavoriteMovieViewModel>();

    return Stack(
      children: [
        Column(
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.S_8),
                child: ImageWithShimmer(
                  imageUrl: movie.imageUrl,
                  width: double.infinity,
                  height: AppSize.S_150,
                ),
              ),
            ),
            Expanded(
              child: Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        Positioned(
          left: AppSize.S_100,
          child: FavoriteButton(
            isFavorite: movie.isFavorite,
            onFavorite: () => vm.unfavoriteMovie(movie.imdbId),
          ),
        ),
      ],
    );
  }
}
