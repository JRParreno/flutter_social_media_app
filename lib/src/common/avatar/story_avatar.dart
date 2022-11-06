import 'package:flutter/material.dart';

import '../../core/theme.dart';

class StoryAvatar extends StatelessWidget {
  const StoryAvatar({
    Key? key,
    required this.index,
    required this.imageUrl,
    this.outerRadius,
    this.innerRadius,
  }) : super(key: key);
  final int index;
  final String imageUrl;
  final double? outerRadius;
  final double? innerRadius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: outerRadius ?? 33,
      backgroundColor:
          index % 2 == 1 ? AppTheme.lightBlue : AppTheme.primaryColor,
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        maxRadius: innerRadius ?? 30,
      ),
    );
  }
}
