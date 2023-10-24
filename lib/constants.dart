// Primary Color
import 'package:flutter/material.dart';

var primary = 0xFFD7FF82;
var primarylight = 0xFFD1F87F;
var primarydark = 0xFFABD84D;

// Dark Bgcolor

var darkBg = 0xFF272F3F;
var darkBglight = 0xFF364156;
var darkBgdark = 0xFF242E39;

// Light Bgcolor
var lightBg = 0xFFF3F3F3;
var lightBglight = 0xFFFFFFFF;
var lightBgdark = 0xFFD4D4D4;

// Extras
var darker = 0xFF212121;
var dark = 0xFF595959;
var danger = 0xFFC33434;
var success = 0xFF52CC83;

final ThemeData lighttheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD7FF82),
    onPrimary: Color(0xFFD1F87F),
    secondary: Color(0xFFD1F87F),
    onSecondary: Color(0xFFD1F87F),
    error: Color(0xFFD1F87F),
    onError: Color(0xFFD1F87F),
    background: Color(0xFF242E39),
    onBackground: Color(0xFF272F3F),
    surface: Color(0xFFD1F87F),
    onSurface: Color(0xFFD1F87F),
  ),
  // Add more theme properties here for the dark theme
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFD7FF82),
    onPrimary: Color(0xFFD1F87F),
    secondary: Color(0xFFD1F87F),
    onSecondary: Color(0xFFD1F87F),
    error: Color(0xFFD1F87F),
    onError: Color(0xFFD1F87F),
    background: Color(0xFF242E39),
    onBackground: Color(0xFF272F3F),
    surface: Color(0xFFD1F87F),
    onSurface: Color(0xFFD1F87F),
  ),
  // Add more theme properties here for the dark theme
);
