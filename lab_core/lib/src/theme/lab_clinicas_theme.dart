import 'package:flutter/material.dart';

final class LabClinicasTheme {
  static const orangeColor = Color(0xffffae45);
  static const lightOrangeColor = Color.fromARGB(255, 255, 231, 198);
  static const blueColor = Color(0xff01bdd6);
  static const lightGreyColor = Color(0xffffefe9);
  
  //lembrete: saber o motivo de não poder ser uma variavel constante, e sim final
  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: lightOrangeColor),
  );

  static final lightTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: lightOrangeColor),
    useMaterial3: true,
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: lightOrangeColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightOrangeColor,
      labelStyle: const TextStyle(
        color: orangeColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
      floatingLabelStyle: const TextStyle(
        color: blueColor,
        fontWeight: FontWeight.w400,
      ),
      border: const OutlineInputBorder(),
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
  );

  static final darkTheme = lightTheme;

}