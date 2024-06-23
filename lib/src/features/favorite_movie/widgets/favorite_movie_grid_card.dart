import 'package:btpro_flutter_case/src/features/favorite_movie/model/favorite_movie.dart';
import 'package:btpro_flutter_case/src/product/widgets/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/resources/app_routes.dart';
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
            onFavorite: () {},
          ),
        ),
      ],
    );
  }
}
