import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/src/common/avatar/story_avatar.dart';
import 'package:social_media_app/src/common/poppins_text.dart';
import 'package:social_media_app/src/profile/bloc/profile_bloc/profile_bloc.dart';
import 'package:status_view/status_view.dart';

import '../core/theme.dart';
import '../models/profile.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "/profile";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ReadContext(context).read<ProfileBloc>().add(ProfileInitialEvent());
      final params = ModalRoute.of(context)!.settings.arguments! as Profile;
      Future.delayed(const Duration(seconds: 1), () {
        handleGetProfile(data: params);
      });
    });
    super.initState();
  }

  void handleGetProfile({required Profile data}) {
    ReadContext(context).read<ProfileBloc>().add(ProfileLoad(profile: data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(0, 70),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppBar(
            centerTitle: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: Center(
              child: Ink(
                decoration: const ShapeDecoration(
                  color: AppTheme.navColorLight,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  tooltip: "Camera",
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.chevron_left_outlined,
                  ),
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            actions: [
              Center(
                child: Ink(
                  decoration: const ShapeDecoration(
                    color: AppTheme.navColorLight,
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
        color: AppTheme.lightColor,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: ((context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProfileLoaded) {
              final double avatarHeight =
                  MediaQuery.of(context).size.height * 0.10;
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: double.infinity,
                          image: NetworkImage(state.profile.backgroundUrl),
                          fit: BoxFit.cover,
                          loadingBuilder: ((context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }),
                        ),
                        Positioned(
                          top: (MediaQuery.of(context).size.height * 0.35) -
                              avatarHeight,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    PoppinsText(
                                      text: state.profile.followers,
                                      style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.darkColor),
                                    ),
                                    const PoppinsText(text: "Followers")
                                  ],
                                ),
                                StoryAvatar(
                                  index: 1,
                                  imageUrl: state.profile.profileUrl,
                                  outerRadius: avatarHeight + 3,
                                  innerRadius: avatarHeight,
                                ),
                                Column(
                                  children: [
                                    PoppinsText(
                                      text: state.profile.following,
                                      style: const TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: AppTheme.darkColor),
                                    ),
                                    const PoppinsText(text: "Following")
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        PoppinsText(
                          text:
                              "${state.profile.firstName} ${state.profile.lastName}",
                          style: const TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.darkColor),
                        ),
                        PoppinsText(
                          text: state.profile.intro,
                        )
                      ],
                    ),
                  )
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
