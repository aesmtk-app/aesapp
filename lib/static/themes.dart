import 'package:aesapp/objects/theme.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// from https://github.com/bitbrain/jekyll-dash
class DarkDashTheme extends AESTheme{
  DarkDashTheme():super(
    isDark: true,
    background: const Color(0xFF1E2227),
    foreground: const Color(0xFFDAE4ED),
    foregroundAlt: const Color(0xFF1E2227),
    foregroundContrast: Colors.white,
    backgroundAlt: const Color(0xFF15171A),
    pink: const Color(0xFFF24784),
    red: const Color(0xFFFC4957),
    orange: const Color(0xFFEA9D53),
    yellow: const Color(0xFFFCBC28),
    teal: const Color(0xFF4BC997),
    green: const Color(0xFF50BD6A),
    cyan: const Color(0xFF4FC1E4),
    blue: const Color(0xFF637AFE),
    indigo: const Color(0xFF6775C4),
    purple: const Color(0xFF8E59D7)
  );

  @override
  ColorScheme toSwatchScheme() {
    return ColorScheme(
      brightness:  Brightness.dark,
      primary: pink,
      secondary: blue,
      tertiary: green,
      surface: background,
      background: backgroundAlt,
      error: red,
      onPrimary: backgroundAlt,
      onSecondary: foreground,
      onTertiary: foreground,
      onSurface: foreground,
      onBackground: foreground,
      onError: backgroundAlt
    );
  }
}
/*
dark: (
                background-color: $color-background-dark,
                background-color-alt: $color-background-darker,
                foreground-color: $color-foreground,
                foreground-color-alt: $color-foreground-dark,
                foreground-color-contrast: white
        ),
        light: (
                background-color: $color-background-lighter,
                background-color-alt: $color-background-light,
                foreground-color: $color-foreground-dark,
                foreground-color-alt: $color-foreground-darker,
                foreground-color-contrast: black
        ),
 */
