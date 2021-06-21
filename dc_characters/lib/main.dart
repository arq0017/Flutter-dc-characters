import 'package:dc_characters/screen/superHeroSliderPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DC Comics',
      theme: ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline4: GoogleFonts.spartan(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.grey[50],
            ),
          ),
        ),
        textTheme: TextTheme(
          headline2: GoogleFonts.spartan(
            fontSize: 38,
            height: 1.0,
            letterSpacing: -2,
            fontWeight: FontWeight.w800,
            color: Colors.grey[200],
          ),
          headline3: GoogleFonts.spartan(
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 3,
          ),
          headline6: GoogleFonts.spartan(
            fontSize: 15,
            height: 1.0,
            fontWeight: FontWeight.w500,
            color: Colors.amber,
          ),
        ),
      ),
      home: SuperheroSliderPage(),
    );
  }
}
