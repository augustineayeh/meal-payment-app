import 'package:flutter/material.dart';

import 'app.dart';
import 'src/core/service_locator/service_locator.dart';

Future<void> main() async {
  await setUpLocator();

  runApp(
    const App(),
  );
}
