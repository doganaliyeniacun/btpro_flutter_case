import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/movie/model/movie.dart';
import '../resources/app_routes.dart';
import '../resources/app_values.dart';
import 'image_with_shimmer.dart';

class MovieGridCard extends StatelessWidget {
  const MovieGridCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.MOVIE_DETAIL,
                arguments: movie.imdbId.toString());
           
          },
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppSize.S_8),
              child: ImageWithShimmer(
                imageUrl: movie.poster ?? '',
                width: double.infinity,
                height: AppSize.S_150,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(
            movie.title ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}
