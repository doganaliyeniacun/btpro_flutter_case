import 'package:btpro_flutter_case/src/features/movie/view/favorite_movie_view.dart';
import 'package:btpro_flutter_case/src/features/movie/view/movie_view.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/custom_convex_app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final RxInt _pageIndex = 0.obs;

  final pages = [
    const MovieView(),
    const FavoriteMovieView(),
  ];

  final Map<String, IconData> pageItems = {
    'Search': Icons.search_outlined,
    'Favorite': Icons.favorite_outlined,
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: pages.length,
        initialIndex: 0,
        child: Obx(() => Scaffold(
              key: scaffoldKey,
              body: pages[_pageIndex.value],
              bottomNavigationBar: CustomConvexAppBar(
                pageItems: pageItems,
                onTap: (index) {
                  _pageIndex.value = index;
                },
              ),
            )),
      ),
    );
  }
}
