import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/features/landing_page/presentation/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData().copyWith(
          textTheme: GoogleFonts.kalamTextTheme(Theme.of(context)
              .textTheme
              .apply(
                  displayColor: Colors.blueGrey, bodyColor: Colors.blueGrey))),
      home: const LandingPage(),
    );
  }
}
