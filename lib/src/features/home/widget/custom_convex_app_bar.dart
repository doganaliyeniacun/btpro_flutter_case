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
      style: tabStyle,
      items: <TabItem>[
        for (final entry in pageItems.entries)
          TabItem(
            icon: Icon(
              entry.value,
            ),
            title: entry.key,
          ),
      ],
      onTap: onTap,
    );
  }
}
