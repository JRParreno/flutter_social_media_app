import 'package:flutter/services.dart' show rootBundle;

Future<String> fixture(String name) async {
  return await rootBundle.loadString(name);
}
