import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/src/core/theme.dart';
import 'package:social_media_app/src/profile/bloc/profile_bloc/profile_bloc.dart';

import '../../home/home.dart';
import '../../profile/profile.dart';

/// The Widget that configures your application.
class HomeNavigation extends StatelessWidget {
  const HomeNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ProfileBloc()),
        ],
        child: MaterialApp(
          home: const HomePage(),
          theme: AppTheme.defaultTheme,
          darkTheme: ThemeData.dark(),
          routes: {
            HomePage.routeName: (ctx) => const HomePage(),
            ProfilePage.routeName: (ctx) => const ProfilePage(),
          },
        ));
  }
}
