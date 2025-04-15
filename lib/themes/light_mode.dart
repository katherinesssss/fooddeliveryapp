import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData( //ThemeData - тема помимо MaterialApp, когда мы хотим сделать приложение в одной стилистике
// и при этом когда от одних экранов зависит цвет связанных элементов. ThemeData содержит внутри конструктора ColorScheme
  colorScheme: ColorScheme.light(
      surface: Colors.grey.shade300, //цвет поверхности(фон карточек)
      primary: Colors.grey.shade500, //основной цвет приложения
      secondary: Colors.grey.shade100, //цвет для акцентов
      tertiary: Colors.white, //третичный цвет
      inversePrimary: Colors.grey.shade700 //когда нужно выделить элемент на фоне основного цвета
  ),
);