import 'package:flutter/material.dart';

import 'story_item.dart';
import 'story_item_model.dart';

class StoryItemListView extends StatelessWidget {
  final List<StoryItemModel> stories;

  const StoryItemListView({Key? key, required this.stories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      padding: const EdgeInsets.all(5.0),
      color: Colors.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return StoryItem(
            story: stories[index],
            index: index,
          );
        },
      ),
    );
  }
}
