import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/poppins_text.dart';
import 'package:social_media_app/src/core/theme.dart';
import 'package:social_media_app/src/home/bloc/post/post_bloc.dart';
import 'package:social_media_app/src/home/bloc/story/story_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/post/post_item_list_view.dart';
import '../common/story/story_item_list_view.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    ReadContext(context).read<StoryBloc>().add(StoryLoadFixture());
    ReadContext(context).read<PostBloc>().add(PostLoadFixture());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 70),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: AppBar(
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0.0,
            leading: Center(
              child: Ink(
                decoration: const ShapeDecoration(
                  color: AppTheme.lightColor,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  tooltip: "Camera",
                  onPressed: () {
                    print("Camera here ");
                  },
                  icon: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            actions: [
              Center(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: AppTheme.lightColor,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.chat_bubble_outline,
                    ),
                    color: AppTheme.primaryColor,
                    onPressed: () {
                      print("Chat");
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              BlocBuilder<StoryBloc, StoryState>(
                builder: (context, state) {
                  if (state is StoryLoading) {
                    return const CircularProgressIndicator(
                      color: AppTheme.primaryColor,
                    );
                  } else if (state is StoryLoaded) {
                    return StoryItemListView(stories: state.stories);
                  } else {
                    return const PoppinsText(text: "Error Loading fixtures");
                  }
                },
              ),
              BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostLoading) {
                    return const CircularProgressIndicator(
                      color: AppTheme.primaryColor,
                    );
                  } else if (state is PostLoaded) {
                    return Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: PostItemList(
                          postList: state.posts,
                        ));
                  } else {
                    return const PoppinsText(text: "Error Loading fixtures");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
