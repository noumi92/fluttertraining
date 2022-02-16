import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes{
  static ThemeData whiteTheme(BuildContext context) => ThemeData(
  primarySwatch: Colors.deepPurple,
  fontFamily: GoogleFonts.lato().fontFamily,
  primaryTextTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: AppBarTheme(
  color: Colors.white,
  elevation: 0.0,
  iconTheme: IconThemeData(color: Colors.black),
  titleTextStyle: Theme.of(context).textTheme.titleLarge
  )
  );
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark
  );
}
