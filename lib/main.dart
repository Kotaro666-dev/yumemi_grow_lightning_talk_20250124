import 'package:flutter/material.dart';
import 'package:yumemi_grow_lightning_talk_20250124/ui/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      //   useMaterial3: true,
      // ),
      home: const LoginPage(),
    );
  }
}
