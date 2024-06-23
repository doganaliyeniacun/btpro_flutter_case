import 'package:btpro_flutter_case/src/features/movie/view_model/movie_view_model.dart';
import 'package:get/get.dart';

class MovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<MovieViewModel>(
      MovieViewModel(),
    );
  }
}
