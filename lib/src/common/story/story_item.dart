import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/poppins_text.dart';
import 'package:social_media_app/src/common/story/story_item_model.dart';
import 'package:social_media_app/src/core/theme.dart';
import 'package:status_view/status_view.dart';

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
          StatusView(
            radius: 30,
            spacing: 15,
            strokeWidth: 2,
            indexOfSeenStatus: 0,
            numberOfStatus: 10,
            padding: 4,
            seenColor: Colors.grey,
            unSeenColor: AppTheme.primaryColor,
            centerImageUrl: story.imageUrl,
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
