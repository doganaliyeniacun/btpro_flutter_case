import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../product/resources/app_colors.dart';
import '../../../product/resources/app_values.dart';

class DetailImage extends StatelessWidget {
  const DetailImage({
    super.key,
    required this.avatarUrl,
  });

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: AppSize.S_20,
        backgroundColor: Colors.transparent,
        backgroundImage: imageProvider,
      ),
      placeholder: (context, _) => Shimmer.fromColors(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade500,
        child: const CircleAvatar(
          radius: AppSize.S_20,
        ),
      ),
      errorWidget: (_, __, ___) => const Icon(
        Icons.error,
        color: AppColors.ERROR,
      ),
    );
  }
}
