import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/auth/login_or_register.dart';
import 'package:fooddeliveryapp/firebase_options.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';
import 'package:fooddeliveryapp/pages/login_page.dart';
import 'auth/auth_gate.dart';
import 'themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'models/restaurant.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // theme provider должен быть первым, если другие провайдеры зависят от него
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // restaurant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const AuthGate(),
            theme: themeProvider.themeData,
          );
        },
      ),
    );
  }
}
