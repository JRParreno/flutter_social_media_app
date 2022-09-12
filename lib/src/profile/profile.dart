import 'package:flutter/material.dart';

import '../core/theme.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "/profile";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
          body: Container(),
        ),
      ],
    );
  }
}
