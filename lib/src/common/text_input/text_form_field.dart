import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;

  const CustomTextFormField({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        autocorrect: false,
      ),
    );
  }
}
