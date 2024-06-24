import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../movie/view/favorite_movie_view.dart';
import '../../movie/view/movie_view.dart';

mixin HomePageMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final int initialIndex = 0;
  final RxInt pageIndex = 0.obs;

  final pages = [
    const MovieView(),
    const FavoriteMovieView(),
  ];

  final Map<String, IconData> pageItems = {
    'Search': Icons.search_outlined,
    'Favorite': Icons.favorite_outlined,
  };
}