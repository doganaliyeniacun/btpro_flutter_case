// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:btpro_flutter_case/src/features/movie/view_model/movie_detail_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailView extends StatelessWidget {
  const MovieDetailView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final vm = Get.find<MovieDetailViewModel>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              
              
              
            ],
          ),
        ),
      ),
    );
  }
}
