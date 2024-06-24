import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mixin/home_page_mixin.dart';
import '../widget/custom_convex_app_bar.dart';

class HomePage extends StatelessWidget with HomePageMixin {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: pages.length,
        initialIndex: initialIndex,
        child: Obx(() => Scaffold(
              key: scaffoldKey,
              body: pages[pageIndex.value],
              bottomNavigationBar: CustomConvexAppBar(
                pageItems: pageItems,
                onTap: (index) {
                  pageIndex.value = index;
                },
              ),
            )),
      ),
    );
  }
}
