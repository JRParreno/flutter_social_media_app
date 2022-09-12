import 'package:flutter/material.dart';

// ignore: avoid_classes_with_only_static_members
class AppTheme {
  //primary colors
  static const Color primaryColor = Color(0xFFA974FF);
  static const Color lightBlue = Color(0xFF9AA3BC);
  //secondary colors
  static const Color secondaryColor = Color(0xFF57B9FF);

  // dark colors
  static const Color darkColor = Color(0xFF25386E);

  // light colors
  static const Color lightColor = Color(0xFFFBFBFB);

  static final defaultTheme = ThemeData(
    fontFamily: "Poppins",
    // primarySwatch: ,
    primaryColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.grey[900],
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevation: MaterialStateProperty.all(0.5),
        // padding: MaterialStateProperty.all(
        //     const EdgeInsets.symmetric(vertical: 14, horizontal: 20)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return AppTheme.primaryColor.withOpacity(0.5);
            } else if (states.contains(MaterialState.disabled)) {
              return AppTheme.darkColor;
            }
            return AppTheme
                .primaryColor; // Use the component's default./ Use the component's default.
          },
        ),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.disabled)) {
            return AppTheme.darkColor;
          }
          return AppTheme.darkColor;
        }),
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}
