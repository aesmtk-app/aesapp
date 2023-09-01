
import 'package:flutter/material.dart';

abstract class AESTheme{
  AESTheme({required this.isDark, required this.foreground, required this.foregroundAlt, required this.foregroundContrast, required this.background, required this.backgroundAlt, Color? pink, Color? red, Color? orange, Color? yellow, Color? teal, Color? green, Color? cyan, Color? blue, Color? indigo, Color? purple}){
    this.pink = pink ?? Colors.pink;
    this.orange = orange ?? Colors.orange;
    this.yellow = yellow ?? Colors.yellow;
    this.teal = teal ?? Colors.teal;
    this.green = green ?? Colors.green;
    this.cyan = cyan ?? Colors.cyan;
    this.blue = blue ?? Colors.blue;
    this.indigo = indigo ?? Colors.indigo;
    this.purple = purple ?? Colors.purple;
  }
  // Foreground
  Color foreground;
  Color foregroundAlt;
  Color foregroundContrast;
  Color background;
  Color backgroundAlt;

  bool isDark;

  // Colors
  Color pink = Colors.black;
  Color red = Colors.red;
  Color orange = Colors.orange;
  Color yellow = Colors.yellow;
  Color teal = Colors.teal;
  Color green = Colors.green;
  Color cyan = Colors.cyan;
  Color blue = Colors.blue;
  Color indigo = Colors.indigo;
  Color purple = Colors.purple;

  ColorScheme toSwatchScheme();
}