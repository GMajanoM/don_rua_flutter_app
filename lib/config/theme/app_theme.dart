import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const mainColor = Color(0xff0d1946);
  static const primaryColor = Color(0xffff65c2);
  static const secondaryColor = Color(0xffec9824);

  ThemeData getTheme() => ThemeData(
        //* General
        useMaterial3: true, brightness: Brightness.light,

        primaryColor: mainColor,

        //* Text
        textTheme: TextTheme(
            //* Titles
            titleLarge: GoogleFonts.poppins()
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            titleMedium: GoogleFonts.poppins().copyWith(fontSize: 16),
            titleSmall: GoogleFonts.poppins().copyWith(fontSize: 14),
            //* Body
            bodyLarge: GoogleFonts.poppins()
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            bodyMedium: GoogleFonts.poppins().copyWith(fontSize: 16),
            bodySmall: GoogleFonts.poppins().copyWith(fontSize: 14)),

        //* Button
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor: const WidgetStatePropertyAll(primaryColor),
            textStyle: WidgetStatePropertyAll(
                GoogleFonts.poppins().copyWith(fontWeight: FontWeight.w700)),
          ),
        ),

        //* Appbar
        appBarTheme: AppBarTheme(
            color: mainColor,
            titleTextStyle: GoogleFonts.poppins().copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(
              color: Colors.white,
            )),
      );
}
