import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.grey[900],
  brightness: Brightness.dark,
  backgroundColor: Colors.black,
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.grey[200],
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
