import 'package:btpro_flutter_case/src/features/favorite_movie/model/favorite_movie.dart';
import 'package:get/get.dart';

import '../service/favorite_movie_service.dart';

class FavoriteMovieViewModel extends GetxController {
  late final IFavoritesMovieService _service;
  RxList<FavoriteMovie> favoritesList = <FavoriteMovie>[].obs;

  @override
  void onInit() async{
    _service = Get.find<FavoriteMoviesService>();
    await _getList();
    super.onInit();
  }

  Future<void> _getList() async {
    favoritesList.value = await _service.getAll();
  }
}
