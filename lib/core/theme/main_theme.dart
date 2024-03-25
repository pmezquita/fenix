import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primary = Color(0xffcc6a00);
const Color primaryDark = Color(0xffcc5500);
const Color primaryLight = Color(0xffff8400);
const Color primaryExtraLight = Color(0xfffff8f3);

const Color secondary = Color(0xff5d6770);
const Color secondaryDark = Color(0xff484f56);
const Color secondaryLight = Color(0xffaeaaaa);
const Color error = Color(0xffF5222D);
const Color success = Color(0xff5CB85C);
const Color disabled = Color(0xffa09d9d);
const Color neutral = Color(0xFFE0E0E0);

const myPaddingForm = EdgeInsets.symmetric(horizontal: 13.0);

class AppTheme {
  AppTheme();

  ThemeData theme() => ThemeData(
        colorSchemeSeed: primary,
        primaryColorLight: primaryLight,
        primaryColorDark: primaryDark,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme().copyWith(
          displayLarge: const TextStyle(color: primaryDark, fontSize: 30.0, fontWeight: FontWeight.bold),
          bodyMedium: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
          titleMedium: const TextStyle(fontWeight: FontWeight.bold),
          titleSmall: const TextStyle(fontWeight: FontWeight.bold),
          displayMedium: const TextStyle(color: Colors.white, fontSize: 15.0),
          labelSmall: const TextStyle( fontSize: 14.0, fontWeight: FontWeight.w700),
        ),
        iconTheme: const IconThemeData(color: primary),
        expansionTileTheme: const ExpansionTileThemeData(
          collapsedIconColor: primaryDark,
          collapsedTextColor: secondaryDark,
          iconColor: primaryLight,
          textColor: primaryDark,
        ),
        listTileTheme: ListTileThemeData(
          iconColor: primary,
          titleTextStyle:
              GoogleFonts.montserrat().copyWith(color: primaryDark, fontSize: 14.0, fontWeight: FontWeight.bold),
          subtitleTextStyle:
              GoogleFonts.montserrat().copyWith(color: secondaryDark, fontSize: 13.0, fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.white,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontSize: 24.0,
          ),
        ),
        cardTheme: const CardTheme(
          color: primaryExtraLight,
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
            textStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
            menuStyle: MenuStyle(backgroundColor: MaterialStateColor.resolveWith((states) => primaryExtraLight))),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary,
          foregroundColor: Colors.white
        ),
        dividerTheme: const DividerThemeData(space: 50.0, color: secondaryLight),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          backgroundColor: primaryExtraLight,
          selectedItemColor: primaryDark,
          unselectedItemColor: primaryDark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0.0,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.0))),
              backgroundColor: primary,
              foregroundColor: Colors.white,
              textStyle: TextStyle(
                  fontFamily: GoogleFonts.montserrat().fontFamily,
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600)),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          prefixIconColor: primaryDark,
          labelStyle: TextStyle(
            // color: Colors.black,
            fontSize: 14.0,
          ),
          hintStyle: TextStyle(
            // color: primaryLight,
            fontSize: 14.0,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: disabled),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: secondaryDark),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6.0)),
            borderSide: BorderSide(color: primary),
          ),
        ),
        dialogTheme: const DialogTheme(
          backgroundColor: primaryExtraLight,
          titleTextStyle: TextStyle(color: primaryDark, fontSize: 15.0),
          contentTextStyle: TextStyle(color: Colors.black, fontSize: 14.0),
          actionsPadding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: secondary),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return primary;
            }
            return secondaryDark;
          }),
          trackColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return primaryLight;
            }
            return secondary;
          }),
        ),
      );
}
