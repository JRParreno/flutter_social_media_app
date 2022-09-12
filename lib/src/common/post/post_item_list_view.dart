import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/post/post_item/post_item.dart';
import 'package:social_media_app/src/common/post/post_item_model.dart';

class PostItemList extends StatelessWidget {
  final List<PostItemModel> postList;
  const PostItemList({Key? key, required this.postList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: postList.map((post) => PostItem(post: post)).toList(),
    );
  }
}
