import 'package:flutter/material.dart';
import 'src/features/schools/presentation/pages/schools_page.dart';

import 'src/core/dummy/pages/schools_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal payment app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SchoolsPage(),
    );
  }
}
