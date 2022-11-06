import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme.of(context).brightness != Brightness.dark
          ? Lottie.asset('assets/lottiefiles/87300-redes-sociales-publico.json')
          : Lottie.asset('assets/lottiefiles/72818-social-networking.json'),
    );
  }
}
