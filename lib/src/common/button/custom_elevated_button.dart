import 'package:flutter/material.dart';
import 'package:social_media_app/src/common/poppins_text.dart';
import 'package:social_media_app/src/core/theme.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final PoppinsText? child;
  final ButtonStyle? style;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.child,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: style ??
            ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.all(10)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(AppTheme.primaryColor),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.blue.withOpacity(0.04);
                  }
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.pressed)) {
                    return Colors.blue.withOpacity(0.12);
                  }
                  return null; // Defer to the widget's default.
                },
              ),
            ),
        onPressed: onPressed,
        child: child ??
            PoppinsText(
                text: label,
                style: const TextStyle(
                  color: AppTheme.lightColor,
                  fontFamily: "Poppins",
                  fontSize: 20,
                )),
      ),
    );
  }
}
