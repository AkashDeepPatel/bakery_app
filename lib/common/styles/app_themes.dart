import 'package:flutter/material.dart';

class AppThemes {
  AppThemes._();

  static const Color primary = Color(0xffF5DD00);
  static const Color primarySubtle1 = Color(0xffE1CC0E);
  static const Color primarySubtle2 = Color(0xffFFFFFF);
  static const Color primarySubtle3 = Color(0xffF7F5FF);
  static const Color primarySubtle4 = Color(0xffFFFAFF);
  static const Color primary2 = Color(0xff1F1D11);
  static const Color primary3 = Color(0xff282508);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color subtle1 = Color(0xff61646B);
  static const Color subtle2 = Color(0xffAFB1B6);
  static const Color subtleDark = Color.fromRGBO(97, 100, 107, 1);
  static const Color subtleLight = Color.fromRGBO(175, 177, 182, 1);
  static const Color background = Color(0xffEFEFF0);
  static const Color surface = Color(0xffFAFAFA);
  static const Color normal = Color(0xff19191B);
  static const Color black = Color(0xff000000);
  static const Color transparent = Colors.transparent;
  static const Color purple = Color(0xffEBE3FF);
  static const Color walkthroughBlue = Color(0xffE5EDFF);

  static String font = "WorkSans";

  //constants color range for light theme
  //main color
  static const Color _lightPrimaryColor = primary;

  //Background Colors
  static const Color _lightBackgroundColor = background;

  static const Color _lightBackgroundSecondaryColor = white;

  //Text Colors
  static const Color _lightTextColor = Colors.black;
  static const Color _lightTextSecondaryColor = subtleDark;
  static const Color _lightIconColor = normal;

  //text theme for light theme
  static const TextTheme _lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w900,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.0,
      color: _lightTextColor,
      fontWeight: FontWeight.normal,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      fontSize: 16.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: TextStyle(
      fontSize: 14.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 16.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 14.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 12.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0,
      color: _lightTextColor,
      fontWeight: FontWeight.normal,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0,
      color: _lightTextColor,
      fontWeight: FontWeight.normal,
    ),
    bodySmall: TextStyle(
      fontSize: 12.0,
      color: _lightTextColor,
      fontWeight: FontWeight.normal,
    ),

//     //........//
//     // overline: const TextStyle(
//     //     fontSize: 10.0,
//     //     color: _lightTextColor,
//     //     fontWeight: FontWeight.w600,
//     //     height: 12),
//     // caption: const TextStyle(
//     //     fontSize: 11.0,
//     //     color: _lightTextColor,
//     //     fontWeight: FontWeight.w600,
//     //     height: 16),
  );

  //the light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: font,
    scaffoldBackgroundColor: _lightBackgroundColor,
    primaryColor: _lightPrimaryColor,
    backgroundColor: _lightBackgroundSecondaryColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: black),
      toolbarTextStyle: _lightTextTheme.bodyMedium,
      titleTextStyle: _lightTextTheme.headlineSmall,
    ),
    listTileTheme: const ListTileThemeData(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(
        color: _lightPrimaryColor,
      ),
      unselectedIconTheme: const IconThemeData(
        color: _lightTextSecondaryColor,
      ),
      selectedLabelStyle: _lightTextTheme.caption,
      unselectedLabelStyle: _lightTextTheme.caption,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: _lightTextSecondaryColor,
      selectedItemColor: _lightPrimaryColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: _lightBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: _lightPrimaryColor,
      // primaryVariant: _lightBackgroundColor,
      // secondary: _lightSecondaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: _lightBackgroundSecondaryColor,
        actionTextColor: _lightBackgroundSecondaryColor),
    iconTheme: const IconThemeData(
      color: subtleLight,
    ),
    dividerTheme: const DividerThemeData(color: subtleDark, thickness: 1),
    popupMenuTheme:
        const PopupMenuThemeData(color: _lightBackgroundSecondaryColor),
    textTheme: _lightTextTheme,
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
      animationDuration: const Duration(milliseconds: 2000),
      backgroundColor: MaterialStateProperty.all(primary),
      textStyle: MaterialStateProperty.all(_lightTextTheme.titleLarge),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
      ),
    )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 2000),
            backgroundColor: MaterialStateProperty.all(_lightBackgroundColor),
            textStyle: MaterialStateProperty.all(_lightTextTheme.titleLarge),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            side: MaterialStateProperty.all(
                const BorderSide(color: _lightPrimaryColor, width: 1)))),
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _lightPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _lightPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
      prefixStyle: TextStyle(color: black),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          )),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: _lightBorderColor, width: 1.0),
      //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderSide: const BorderSide(color: _lightBorderActiveColor),
      //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
      // ),
      // errorBorder: const OutlineInputBorder(
      //   borderSide: BorderSide(color: _lightBorderErrorColor),
      //   borderRadius: BorderRadius.all(const Radius.circular(8.0)),
      // ),
      // focusedErrorBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: _lightBorderErrorColor),
      //   borderRadius: BorderRadius.all(Radius.circular(8.0)),
      // ),
      fillColor: _lightBackgroundSecondaryColor,
      //focusColor: _lightBorderActiveColor,
    ),
  );
}
