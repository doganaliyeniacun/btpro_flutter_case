// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.isFavorite,
    required this.onFavorite,
  });

  final bool isFavorite;
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return ElevatedButton.icon(
      onPressed: onFavorite,
      label: Icon(
        isFavorite ? Icons.favorite_outlined : Icons.favorite_border_outlined,
        color: theme.colorScheme.primary,
      ),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: theme.colorScheme.secondary,
      ),
    );
  }
}
