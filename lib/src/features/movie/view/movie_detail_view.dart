import 'package:auto_size_text/auto_size_text.dart';
import 'package:btpro_flutter_case/src/features/movie/view_model/movie_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../product/resources/app_values.dart';
import '../../../product/widgets/favorite_button.dart';
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
              // header
              Stack(
                children: [
                  // poster
                  _poster(vm.movie.poster.toString()),
                  Positioned(
                    top: AppSize.S_20,
                    // go to back button
                    child: _goToBackButton(),
                  ),
                  Positioned(
                    left: Get.width * 0.8,
                    top: AppSize.S_20,
                    // favorite button
                    child: Obx(
                      () => FavoriteButton(
                        isFavorite: vm.isFavorite.value,
                        onFavorite: vm.changeFavoriteState,
                      ),
                    ),
                  ),
                ],
              ),
              // body
              Padding(
                padding: const EdgeInsets.all(AppSize.S_14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // movie title
                            _title(vm.movie.title.toString(), AppSize.S_20),
                            const SizedBox(height: AppSize.S_10),
                            // release information
                            _releasedInfo(vm.movie.released.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            // rating bar
                            _customRatingBarIndicator(
                                vm.movie.imdbRating.toString()),
                            const SizedBox(height: AppSize.S_10),
                            // votes
                            _votes(vm.movie.imdbVotes.toString()),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSize.S_10),
                    // plot
                    _customAutoSizeText(vm.movie.plot.toString()),
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

  Text _releasedInfo(String releasedText) {
    return Text(
      releasedText,
      style: TextStyle(
        fontSize: AppSize.S_14,
        color: Colors.grey.shade600,
      ),
    );
  }

  Text _title(String title, double fontSize) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text _votes(String votesText) {
    return Text(
      votesText,
      style: TextStyle(fontSize: AppSize.S_14, color: Colors.grey.shade600),
    );
  }

  RatingBarIndicator _customRatingBarIndicator(String ratingValue) {
    return RatingBarIndicator(
      rating: double.parse(ratingValue) / 2,
      itemBuilder: (context, index) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: AppSize.S_20,
      direction: Axis.horizontal,
    );
  }

  AutoSizeText _customAutoSizeText(String plotText) {
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
        size: AppSize.S_34,
      ),
    );
  }

  ImageWithShimmer _poster(String imageUrl) {
    return ImageWithShimmer(
      imageUrl: imageUrl,
      width: double.infinity,
      height: Get.height * 0.5,
      boxFit: BoxFit.fill,
    );
  }
}
