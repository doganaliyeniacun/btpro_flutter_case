import 'dart:async';

import 'package:btpro_flutter_case/src/features/movie/view_model/movie_view_model.dart';
import 'package:btpro_flutter_case/src/product/resources/app_values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../product/resources/app_strings.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final _textController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {  
    return Form(
      child: TextFormField(
        controller: _textController,
        cursorWidth: AppSize.S_1,
        style: context.textTheme.bodyLarge,
        onChanged: _onTextChanged,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.S_8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.S_8),
          ),
          prefixIcon: const Icon(
            Icons.search_rounded,
          ),
          suffixIcon: GestureDetector(
            onTap: _cleanText,
            child: const Icon(
              Icons.clear_rounded,
            ),
          ),
          hintText: AppStrings.SEARCH_HINT,
          hintStyle: context.textTheme.bodyLarge,
        ),
      ),
    );
  }

  void _cleanText() {
    _textController.text = '';
    Get.find<MovieViewModel>().setRequestStatus(RequestStatus.INITIAL);
  }

  void _onTextChanged(String text) {
    if (_textController.text == '') return;

    const duration = Duration(seconds: 1);

    if (_debounce?.isActive ?? false) _debounce?.cancel();

    _debounce = Timer(duration, () {
      Get.find<MovieViewModel>().getMovies(text);
    });
  }
}
