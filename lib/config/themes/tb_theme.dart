import 'package:flutter/material.dart';
import 'package:thingsboard_app/utils/transition/page_transitions.dart';

// Custom Steel Blue & Orange Palette
const int _tbPrimaryColorValue = 0xFF5E6D85;       // Steel Blue primary
const Color _tbPrimaryColor = Color(_tbPrimaryColorValue);
const Color _tbSecondaryColor = Color(0xFF4E5F78);     // Darker Steel Blue
const Color _tbAccentColor = Color(0xFFFF7A45);        // Orange accent
const Color _tbDarkPrimaryColor = Color(0xFFFFB74D);   // Light Orange for dark theme
Color get appPrimaryColor => _tbPrimaryColor;
const Color _tbHeaderColor = Color(0xFF40536C);        // Steel Blue header
const Color _tbBackgroundColor = Color(0xFFFAFAFA);    // Off-white Background


Typography tbTypography = Typography.material2018();

// Steel Blue MaterialColor swatch
const tbMatIndigo = MaterialColor(_tbPrimaryColorValue, <int, Color>{
  50: Color(0xFFE6EAF0),   // Very light Steel Blue
  100: Color(0xFFD6DCE6),  // Light Steel Blue
  200: Color(0xFFACB5C5),  // 
  300: Color(0xFF8A95AA),  //
  400: Color(0xFF74829B),  //
  500: _tbPrimaryColor,    // #5E6D85 - Main Steel Blue
  600: _tbSecondaryColor,  // #4E5F78 - Darker Steel Blue
  700: Color(0xFF40536C),  // Header color
  800: Color(0xFF344459),  //
  900: Color(0xFF283546),  // Darkest Steel Blue
});

// Dark theme MaterialColor swatch
const tbDarkMatIndigo = MaterialColor(_tbPrimaryColorValue, <int, Color>{
  50: Color(0xFFE6EAF0),
  100: Color(0xFFD6DCE6),
  200: Color(0xFFACB5C5),
  300: Color(0xFF8A95AA),
  400: Color(0xFF74829B),
  500: _tbDarkPrimaryColor,  // #FFB74D - Light Orange for dark theme
  600: _tbSecondaryColor,
  700: Color(0xFF40536C),
  800: _tbPrimaryColor,
  900: Color(0xFF283546),
});

final ThemeData theme = ThemeData(primarySwatch: tbMatIndigo);

ThemeData tbTheme = ThemeData(
  useMaterial3: false,
  primarySwatch: tbMatIndigo,
  colorScheme: theme.colorScheme.copyWith(
    primary: tbMatIndigo,
    secondary: _tbAccentColor,  // Orange accent
  ),
  scaffoldBackgroundColor: _tbBackgroundColor,  // #FAFAFA
  textTheme: tbTypography.black,  // Black text theme for Light Mode
  primaryTextTheme: tbTypography.black,  // Black text theme
  typography: tbTypography,
  appBarTheme: const AppBarTheme(
    backgroundColor: _tbHeaderColor,  // #40536C Steel Blue header
    foregroundColor: Colors.white,    // White text on header
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,  // White background
    selectedItemColor: Color(0xFFFFA726),  // Brand Orange
    unselectedItemColor: Color(0xFF283546),  // Dark Steel Blue
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: FadeOpenPageTransitionsBuilder(),
      TargetPlatform.android: FadeOpenPageTransitionsBuilder(),
    },
  ),
);

final ThemeData darkTheme = ThemeData(
  primarySwatch: tbDarkMatIndigo,
  brightness: Brightness.dark,
);

ThemeData tbDarkTheme = ThemeData(
  primarySwatch: tbMatIndigo, // Use main swatch
  colorScheme: theme.colorScheme.copyWith(
    primary: tbMatIndigo,
    secondary: _tbAccentColor,
  ),
  brightness: Brightness.light, // FORCE LIGHT MODE
  scaffoldBackgroundColor: _tbBackgroundColor,  // #FAFAFA
  textTheme: tbTypography.black,  // Black text
  primaryTextTheme: tbTypography.black,
  typography: tbTypography,
  appBarTheme: const AppBarTheme(
    backgroundColor: _tbHeaderColor,  // #40536C
    foregroundColor: Colors.white,    // White text
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xFFFFA726),
    unselectedItemColor: Color(0xFF283546),
    showSelectedLabels: true,
    showUnselectedLabels: true,
  ),
);
