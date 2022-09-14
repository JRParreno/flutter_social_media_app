import 'package:flutter/material.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({Key? key, this.actions, this.leading, this.title})
      : super(key: key);
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: title,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: leading,
      actions: actions,
    );
  }
}
