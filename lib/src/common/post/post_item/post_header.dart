import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/post/post_item_model.dart';
import 'package:social_media_app/src/profile/profile.dart';
import 'package:status_view/status_view.dart';

import '../../../core/theme.dart';
import '../../poppins_text.dart';

class PostHeader extends StatelessWidget {
  final PostItemModel post;

  const PostHeader({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: InkWell(
            child: StatusView(
              radius: 20,
              spacing: 15,
              strokeWidth: 2,
              indexOfSeenStatus: 0,
              numberOfStatus: 10,
              padding: 4,
              seenColor: Colors.grey,
              unSeenColor: AppTheme.primaryColor,
              centerImageUrl: post.profileUrl,
            ),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const ProfilePage()));
            },
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsText(
              text: "${post.firstName} ${post.lastName}",
              style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14,
                color: AppTheme.darkColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            if (post.location != null)
              PoppinsText(
                text: post.location!,
                style: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12,
                  color: AppTheme.darkColor,
                  fontStyle: FontStyle.normal,
                ),
              )
          ],
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(
                Icons.more_horiz_rounded,
                color: AppTheme.darkColor,
              ),
              onPressed: () {},
              color: AppTheme.lightBlue,
            ),
          ],
        ))
      ],
    );
  }
}
