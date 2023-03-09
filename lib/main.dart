import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stoke/app_routes.dart';
import 'package:stoke/on_generate_route.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.purple, // set color of status bar
    ));

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        initialRoute: AppRoutes.batch,
        onGenerateRoute: RoutesGenerator.onGenerate,
        onUnknownRoute: (_) => RoutesGenerator.errorRoute());
  }
}
