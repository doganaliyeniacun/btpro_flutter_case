import 'package:btpro_flutter_case/src/features/favorite_movie/view_model/favorite_movie_view_model.dart';
import 'package:btpro_flutter_case/src/features/movie/view_model/movie_view_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/resources/app_values.dart';
import '../widgets/favorite_movies_grid_view.dart';

class FavoriteMoviesView extends StatelessWidget {
  const FavoriteMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.put<FavoriteMovieViewModel>(FavoriteMovieViewModel());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(
            top: AppPadding.P_12,
            left: AppPadding.P_16,
            right: AppPadding.P_16,
          ),
          child: Column(
            children: [
              FavoriteMoviesGridView(movies: vm.favoritesList),
            ],
          ),
        ),
      ),
    );
  }
}
