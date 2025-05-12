import 'package:flutter/material.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({super.key});

  @override
  State<MyCurrentLocation> createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  String currentLocation = "Ufa Russia, Kusimova 15-43";  // Начальное значение локации
  final TextEditingController _locationController = TextEditingController();  // Контроллер для TextField
  void openLocationSearchBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your location"),
        content: TextField(
          controller: _locationController,
          decoration: const InputDecoration(hintText: "Search address..."),
        ),
        actions: [
          // Cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          // Save button
          MaterialButton(
            onPressed: () {
              setState(() {
                currentLocation = _locationController.text;  // Сохраняем новое значение
              });
              Navigator.pop(context);  // Закрываем диалог
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();  // очищаем контроллер,чтобы оптимизировать работу приложения
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
          ),
          GestureDetector( //при нажатии на иконку либо текст откроется окно с изменением локации, т.к. он оборачивает их
            //делая всю область внутри себя кликабельной
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                // Address (теперь отображает текущее значение)
                Text(
                  currentLocation,  // Используем сохраненное значение
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                // Drop down menu
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}