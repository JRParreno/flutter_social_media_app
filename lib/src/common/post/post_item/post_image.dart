import 'package:flutter/material.dart';
import 'package:social_media_app/src/models/post_item_model.dart';

class PostImage extends StatelessWidget {
  final PostItemModel post;

  const PostImage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Image border
        child: Image(
          image: NetworkImage(post.postImageUrl),
          fit: BoxFit.cover,
          loadingBuilder: ((context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          }),
        ),
      ),
    );
  }
}
