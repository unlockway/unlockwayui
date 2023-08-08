import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unlockway/responsive_screen.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unlockway',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarColor: Colors.transparent)),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(primary),
        ),
      ),
      home: const ResponsiveScreen(),
    );
  }
}
