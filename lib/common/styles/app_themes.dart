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
  static const Color _lightPrimaryColor = black;

  //Background Colors
  static const Color _lightBackgroundColor = background;

  static const Color _lightBackgroundSecondaryColor = white;

  //Text Colors
  static const Color _lightTextColor = Colors.black;
  static const Color _darkTextColor = Colors.white;
  static const Color _lightTextSecondaryColor = subtleDark;

  //text theme for light theme
  static const TextTheme _lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32.0,
      color: _lightTextColor,
      fontWeight: FontWeight.normal,
    ),
    headlineMedium: TextStyle(
      fontSize: 28.0,
      color: _lightTextColor,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      fontSize: 22.0,
      color: _lightTextColor,
      fontWeight: FontWeight.normal,
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
      backgroundColor: black,
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
      backgroundColor: MaterialStateProperty.all(_lightPrimaryColor),
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



  //constants color range for dark theme
  static const Color _darkPrimaryColor = primary;

  //Background Colors
  static const Color _darkBackgroundColor = black;
  static const Color _darkBackgroundAppBarColor = _darkPrimaryColor;
  static const Color _darkBackgroundSecondaryColor =
  Color.fromRGBO(0, 0, 0, .4);
  // static const Color _darkBackgroundAlertColor = blackPearl;
  static const Color _darkBackgroundActionTextColor = white;

  // static const Color _darkBackgroundErrorColor =
  //     Color.fromRGBO(255, 97, 136, 1);
  // static const Color _darkBackgroundSuccessColor =
  //     Color.fromRGBO(186, 215, 97, 1);

  //Text Colors
  // static const Color _darkTextColor = Colors.white;
  // static const Color _darkTextSecondaryColor = whiteLilac;

  //Border Color
  //static const Color _darkBorderColor = nevada;

  //Icon Color
  static const Color _darkIconColor = black;

  //static const Color _darkInputFillColor = _darkBackgroundSecondaryColor;
  static const Color _darkBorderActiveColor = _darkPrimaryColor;
  // static const Color _darkBorderErrorColor = brinkPink;

  static const TextTheme _darkTextTheme = TextTheme(
    displayLarge: TextStyle(
        fontSize: 24.0, color: _darkTextColor, fontWeight: FontWeight.w800),
    displayMedium: TextStyle(
        fontSize: 22.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    displaySmall: TextStyle(
        fontSize: 20.0,
        // color: _lightBackgroundSuccessColor,
        fontWeight: FontWeight.w500),

    headlineLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: _lightTextColor,
    ),

    headlineMedium: TextStyle(
        fontSize: 18.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      color: _darkTextColor,
    ),
    bodyLarge: TextStyle(fontSize: 14.0, color: _darkTextColor),
    bodyMedium: TextStyle(
        fontSize: 12.0,
        color: _darkTextColor,
        fontWeight: FontWeight.normal),
    labelLarge: TextStyle(
        fontSize: 16.0,
        color: _darkBackgroundColor,
        fontWeight: FontWeight.w500),
    titleLarge: TextStyle(fontSize: 16.0, color: _darkTextColor),
    titleMedium: TextStyle(
        fontSize: 16.0, color: _darkTextColor, fontWeight: FontWeight.normal),
    titleSmall: TextStyle(
        fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 12.0, color: _darkBackgroundAppBarColor),
    labelMedium: TextStyle(
        fontSize: 14.0,
        color: _darkPrimaryColor,
        fontWeight: FontWeight.normal),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    //prefix icon color form input on focus
    fontFamily: font,
    scaffoldBackgroundColor: _darkBackgroundColor,
    // secondaryHeaderColor: darkBlueShade2,
    indicatorColor: _darkTextColor,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _darkPrimaryColor,
    ),
    cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    appBarTheme: AppBarTheme(
      color: _darkBackgroundAppBarColor,
      iconTheme: const IconThemeData(color: _darkTextColor),
      // toolbarTextStyle: _darkTextTheme.bodyMedium,
      // titleTextStyle: _darkTextTheme.titleLarge,
    ),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(color: Colors.white),
        // backgroundColor: _darkBackgroundAlertColor,
        actionTextColor: _darkBackgroundActionTextColor),
    iconTheme: const IconThemeData(
      color: _darkIconColor, //_darkIconColor,
    ),
    popupMenuTheme: const PopupMenuThemeData(color: _darkBackgroundAppBarColor),
    textTheme: _darkTextTheme,
    buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        buttonColor: _darkPrimaryColor,
        textTheme: ButtonTextTheme.primary),
    unselectedWidgetColor: _darkPrimaryColor,
    inputDecorationTheme: const InputDecorationTheme(
        prefixStyle: const TextStyle(color: _darkIconColor),
        isDense: true,
        contentPadding: EdgeInsets.all(16),
        //labelStyle: TextStyle(color: nevada),
        border: OutlineInputBorder(
            borderSide: const BorderSide(
                color: _darkBackgroundSecondaryColor, width: 1.0),
            borderRadius: const BorderRadius.all(
              Radius.circular(8.0),
            )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: _darkBorderActiveColor),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        // errorBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: _darkBorderErrorColor),
        //   borderRadius: BorderRadius.all(const Radius.circular(8.0)),
        // ),
        // hoverColor: transparent,
        // focusedErrorBorder: const OutlineInputBorder(
        //   borderSide: BorderSide(color: _darkBorderErrorColor),
        //   borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        // ),
        fillColor: Colors.white38,
        filled: true
      //focusColor: _darkBorderActiveColor,
    ),
    colorScheme: const ColorScheme.dark(
      primary: _darkTextColor,
      // secondary: _darkSecondaryColor,
    ),
    primaryColor: _darkPrimaryColor,
    listTileTheme: const ListTileThemeData(),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: const IconThemeData(
        color: _darkPrimaryColor,
      ),
      unselectedIconTheme: const IconThemeData(
        // color: _darkTextSecondaryColor,
      ),
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: _darkTextTheme.bodySmall,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      // unselectedItemColor: _darkTextSecondaryColor,
      selectedItemColor: _darkPrimaryColor,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: _darkBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), bottomRight: Radius.circular(24)),
      ),
    ),
    dividerTheme: const DividerThemeData(
        color: _darkBackgroundSecondaryColor, thickness: 2),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 2000),
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          textStyle: MaterialStateProperty.all(_darkTextTheme.labelLarge),
        )),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          animationDuration: const Duration(milliseconds: 2000),
          backgroundColor: MaterialStateProperty.all(Colors.lightBlue),
          textStyle: MaterialStateProperty.all(_darkTextTheme.labelLarge),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
          ),
        )),
    outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
            animationDuration: const Duration(milliseconds: 2000),
            backgroundColor: MaterialStateProperty.all(_darkBackgroundColor),
            textStyle: MaterialStateProperty.all(_darkTextTheme.labelLarge),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
            side: MaterialStateProperty.all(
                const BorderSide(color: _darkPrimaryColor, width: 1)))),
  );
}
