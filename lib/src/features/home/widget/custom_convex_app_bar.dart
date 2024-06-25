import 'package:btpro_flutter_case/src/product/util/extension/theme_extension.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class CustomConvexAppBar extends StatelessWidget {
  const CustomConvexAppBar({
    super.key,
    required this.pageItems,
    this.onTap,
    this.tabStyle = TabStyle.reactCircle,
  });

  final Map<String, IconData> pageItems;
  final GestureTapIndexCallback? onTap;
  final TabStyle tabStyle;

  @override
  Widget build(BuildContext context) {

    return ConvexAppBar(
      backgroundColor: context.colorScheme.primary,
      color: context.colorScheme.secondary,
      style: tabStyle,
      items: <TabItem>[
        for (final entry in pageItems.entries)
          TabItem(
            icon: Icon(
              entry.value,
              color: context.colorScheme.surface,
            ),
            title: entry.key,
          ),
      ],
      onTap: onTap,
    );
  }
}
