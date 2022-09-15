import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/poppins_text.dart';
import 'package:social_media_app/src/common/story/story_item_model.dart';
import 'package:social_media_app/src/core/theme.dart';

import '../avatar/story_avatar.dart';

class StoryItem extends StatelessWidget {
  final StoryItemModel story;
  final int index;

  const StoryItem({Key? key, required this.story, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 70,
      child: Column(
        children: [
          StoryAvatar(
            index: index,
            imageUrl: story.imageUrl,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: PoppinsText(
                text: index == 0 ? "You" : story.firstName,
                maxLines: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
