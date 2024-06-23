// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    this.isFavorite = false,
    this.onFavorite,
  });

  final bool isFavorite;
  final VoidCallback? onFavorite;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(      
      onPressed: onFavorite,
      label: Icon(
        isFavorite
            ? Icons.favorite_outlined
            : Icons.favorite_border_outlined,
        color: Colors.red,
      ),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
      ),
    );
  }
}
