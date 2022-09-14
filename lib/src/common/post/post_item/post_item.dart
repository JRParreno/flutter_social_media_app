import 'package:flutter/material.dart';

import '../../../models/post_item_model.dart';
import 'post_header.dart';
import 'post_image.dart';
import 'post_interaction.dart';

class PostItem extends StatelessWidget {
  final PostItemModel post;
  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      child: Column(
        children: [
          PostHeader(post: post),
          PostImage(
            post: post,
          ),
          PostInteraction(
            post: post,
          )
        ],
      ),
    );
  }
}
