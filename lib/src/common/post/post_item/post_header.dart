import 'package:flutter/material.dart';
import 'package:social_media_app/src/models/post_item_model.dart';
import 'package:social_media_app/src/models/profile.dart';
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
              Navigator.of(context).pushNamed(ProfilePage.routeName,
                  arguments: Profile(
                    id: "932",
                    firstName: post.firstName,
                    lastName: post.lastName,
                    profileUrl: post.profileUrl,
                    intro: "Take it easy",
                    followers: "100k",
                    following: "299",
                    backgroundUrl:
                        "https://img.freepik.com/free-photo/portrait-beautiful-healthy-young-adults-girlfriend-boyfriend-hugging-happy-young-pretty-couple-love-dating-sunny-spring-along-beach-warm-colors_273443-1155.jpg?w=2000",
                  ));
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
