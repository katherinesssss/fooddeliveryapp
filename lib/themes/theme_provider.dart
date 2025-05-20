import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/themes/dark_mode.dart';
import 'package:fooddeliveryapp/themes/light_mode.dart';


class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode; //переменная типа ThemeData

  ThemeData get themeData => _themeData; //получаем извне значение переменной

  bool get isDarkMode => _themeData == darkMode;//для переключения в настройках
//true-если _themedata равна темной теме, false - в противном случае
  set themeData(ThemeData themeData) { //изменяем извне значение переменной
    _themeData = themeData;
    notifyListeners(); //это заставляет слушающие виджеты перерисовываться
    //с новой темой
  }

  void toggleTheme() {//происходит изменение темы когда мы в настройках меняем режим
    if (_themeData == lightMode){
      themeData = darkMode;
    }
    else {
      themeData = lightMode;
    }
  }

}
