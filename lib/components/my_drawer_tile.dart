import 'package:flutter/material.dart';
//вместо того чтобы каждый раз писать ListTile с одинаковыми стилями,
// мы просто используем MyDrawerTile с нужными параметрами.
class MyDrawerTile extends StatelessWidget {

  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const MyDrawerTile({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(title: Text(text, style: TextStyle(color: Theme
          .of(context)
          .colorScheme
          .inversePrimary),),

        leading:Icon(icon,color: Theme.of(context).colorScheme.inversePrimary,
          //leading - свойство ListTile для отображения иконки перед текстом.
      ),
        onTap: onTap,
      ),
    );
  }
}
