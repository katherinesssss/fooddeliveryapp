import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Container(
            decoration:
            BoxDecoration(color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.only(left: 25,top: 10,right: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //dark mode
                Text("Dark Mode",style: TextStyle(fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary
                  ),
                ),
                CupertinoSwitch(
                  value: context.watch<ThemeProvider>().isDarkMode,
                  onChanged: (value) => context.read<ThemeProvider>().toggleTheme(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
