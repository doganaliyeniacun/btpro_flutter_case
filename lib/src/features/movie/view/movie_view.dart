import 'package:btpro_flutter_case/src/features/movie/view_model/movie_view_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/resources/app_values.dart';
import '../widgets/movies_grid_view.dart';
import '../widgets/search_field.dart';

class MovieView extends StatelessWidget {
  const MovieView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Get.put<MovieViewModel>(MovieViewModel());

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
              const SearchField(),
              Obx(
                () {
                  switch (vm.requestStatus.value) {
                    case RequestStatus.LOADING:
                      return const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      );

                    case RequestStatus.SUCCESS:
                      return Expanded(
                        child: MoviesGridView(movies: vm.moviesList),
                      );
                    default:
                      return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
