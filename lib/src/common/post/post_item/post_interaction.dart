import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/poppins_text.dart';
import 'package:social_media_app/src/common/post/post_item_model.dart';
import 'package:social_media_app/src/core/theme.dart';

class PostInteraction extends StatelessWidget {
  final PostItemModel post;

  const PostInteraction({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.thumb_up_alt_outlined),
          color: AppTheme.darkColor,
        ),
        const PoppinsText(text: "6.2k"),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chat_bubble_outline_outlined),
          color: AppTheme.darkColor,
        ),
        const PoppinsText(text: "2.9k"),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.bookmark_outline_outlined),
          color: AppTheme.darkColor,
        ),
        const PoppinsText(text: "200")
      ],
    );
  }
}
