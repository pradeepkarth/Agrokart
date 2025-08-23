import 'package:flutter/material.dart';
import 'package:myapp/core/app_router.dart';

import 'core/utils/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(const MyApp());
}

/// The root widget of the Agrokart application.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] instance.
  const MyApp({super.key});

  /// Builds the main MaterialApp for the project.
  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: appRouter,
    );
}
