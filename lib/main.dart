import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'socmed_bloc_observer.dart';
import 'src/app.dart';

void main() async {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SocmedBlocObserver(),
  );
}
