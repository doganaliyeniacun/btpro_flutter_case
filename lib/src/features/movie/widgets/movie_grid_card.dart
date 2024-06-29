// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/resources/app_values.dart';
import '../../../product/widgets/favorite_button.dart';
import '../../../product/widgets/image_with_shimmer.dart';

class MovieGridCard extends StatelessWidget {
  const MovieGridCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
    this.isFavorite,
    this.onFavoriteTap,
  });

  final VoidCallback? onTap;
  final String? imageUrl;
  final String? title;
  final bool? isFavorite;
  final VoidCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: AspectRatio(
                aspectRatio: 2 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppSize.S_8),
                  child: ImageWithShimmer(
                    imageUrl: imageUrl ?? '',
                    width: double.infinity,
                    height: AppSize.S_150,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                title ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
        isFavorite != null
            ? Positioned(
                left: AppSize.S_100,
                child: FavoriteButton(
                  isFavorite: isFavorite ?? false,
                  onFavorite: onFavoriteTap,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
