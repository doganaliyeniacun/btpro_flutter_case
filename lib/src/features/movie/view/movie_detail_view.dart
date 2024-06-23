import 'package:auto_size_text/auto_size_text.dart';
import 'package:btpro_flutter_case/src/features/movie/view_model/movie_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/resources/app_values.dart';
import '../../../product/widgets/image_with_shimmer.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<MovieDetailsViewModel>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              //header
              Stack(
                children: [
                  _moviePoster(vm.movie!.poster.toString()),
                  Positioned(
                    top: AppSize.S_20,
                    child: _goToBackButton(),
                  ),
                ],
              ),
              // details
              Padding(
                padding: const EdgeInsets.all(AppSize.S_14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              vm.movie!.title.toString(),
                              style: const TextStyle(
                                fontSize: AppSize.S_20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: AppSize.S_10),
                            Text(
                              vm.movie!.released.toString(),
                              style: TextStyle(
                                  fontSize: AppSize.S_14,
                                  color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.S_10),
                    _plot(vm.movie!.plot.toString(),),
                    const SizedBox(height: AppSize.S_10),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  AutoSizeText _plot(String plotText) {
    return AutoSizeText(
      plotText,
      style: const TextStyle(
        fontSize: AppSize.S_14,
      ),
      maxLines: 10,
      overflow: TextOverflow.ellipsis,
    );
  }

  ElevatedButton _goToBackButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
      onPressed: () {
        Get.back();
      },
      label: const Icon(
        Icons.arrow_back_ios_new_outlined,
        color: Colors.white,
        size: 34,
      ),
    );
  }

  ImageWithShimmer _moviePoster(String imageUrl) {
    return ImageWithShimmer(
      imageUrl: imageUrl,
      width: double.infinity,
      height: Get.height * 0.5,
      boxFit: BoxFit.fill,
    );
  }
}
