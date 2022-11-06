import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/navigation/bottom_navigation.dart';
import 'package:social_media_app/src/common/poppins_text.dart';

import '../../../common/button/button.dart';
import '../../../common/text_input/text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFormField(
          key: Key('login_username'),
          label: "Phone or Email",
        ),
        const CustomTextFormField(
          key: Key('login_password'),
          label: "Password",
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [PoppinsText(text: "Forgot Password")],
          ),
        ),
        SizedBox(
          width: double.infinity,
          child: CustomElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(BottomNavigation.routeName);
            },
            label: "LOGIN",
          ),
        )
      ],
    );
  }
}
