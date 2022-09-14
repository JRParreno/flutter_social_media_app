import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/src/profile/bloc/profile_bloc/profile_bloc.dart';

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
      Future.delayed(const Duration(seconds: 3), () {
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
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: ((context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileLoaded) {
            return Image(
              image: const NetworkImage(
                  "https://media.architecturaldigest.com/photos/5d97a9305244a50008428cff/master/w_1600%2Cc_limit/AD1119_SYSTROM_7.jpg"),
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
            );
          }
          return Container();
        }),
      ),
    );
  }
}
