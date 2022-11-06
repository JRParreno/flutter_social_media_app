import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/poppins_text.dart';
import 'package:social_media_app/src/core/theme.dart';
import 'package:social_media_app/src/non_auth/login/widgets/header_login.dart';

import 'widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              HeaderLogin(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: PoppinsText(
                  text: "Social Media App",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
