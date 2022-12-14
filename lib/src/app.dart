import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media_app/src/core/theme.dart';
import 'package:social_media_app/src/home/bloc/post/post_bloc.dart';
import 'package:social_media_app/src/home/bloc/story/story_bloc.dart';
import 'package:social_media_app/src/non_auth/login/login.dart';

import 'common/navigation/bottom_navigation.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => StoryBloc()),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(
        home: const LoginPage(),
        theme: AppTheme.defaultTheme,
        darkTheme: AppTheme.darkmTheme,
        routes: {
          LoginPage.routeName: (ctx) => const LoginPage(),
          BottomNavigation.routeName: (ctx) => const BottomNavigation(),
        },
      ),
    );
  }
}
