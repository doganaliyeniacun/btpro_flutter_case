// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageWithShimmer extends StatelessWidget {
  const ImageWithShimmer({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    this.boxFit = BoxFit.cover,
  });

  final String imageUrl;
  final double height;
  final double width;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: boxFit,
      placeholder: (_, __) => Shimmer.fromColors(
        baseColor: Colors.grey.shade500,
        highlightColor: Colors.grey.shade700,
        child: Container(
          height: height,
        ),
      ),
      errorWidget: (_, __, ___) => const Icon(
        Icons.error,
      ),
    );
  }
}
