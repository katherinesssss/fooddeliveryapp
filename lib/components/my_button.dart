import 'package:flutter/material.dart';

class MyButton extends StatelessWidget { //кнопка- неизменяемый виджет
  final Function()? onTap; //переход куда-то с помощью одиночного касания
  final String text; //текст на кнопке
  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(//реагирует на жесты пользователя на экране, onTap-одиночное касание
      child: Container(
        padding: const EdgeInsets.all(25),//отступы от текста внутри кнопки, т.к. мы родительский виджет, а текст дочерний
        margin: const EdgeInsets.symmetric(horizontal: 25), //отступы горизонтальные от сторон экрана
        //padding- отступы внутри элементами контейнера
        //margin- отступ между границей контейнера и другими элементами
        decoration:
        BoxDecoration(color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
            ),
          ),
        ),

      ),
    );
  }
}
