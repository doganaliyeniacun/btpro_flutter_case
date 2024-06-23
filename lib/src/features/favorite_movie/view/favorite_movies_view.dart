import 'package:btpro_flutter_case/src/features/movie/view_model/movie_view_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/resources/app_values.dart';
import '../../../product/widgets/movies_grid_view.dart';

class FavoriteMoviesView extends StatelessWidget {
  const FavoriteMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<MovieViewModel>();

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
              Obx(
                () {
                  return MoviesGridView(movies: vm.moviesList);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
